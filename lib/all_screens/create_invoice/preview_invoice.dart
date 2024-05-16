import 'dart:io';
import 'dart:math';
import 'package:easyinvoice/all_screens/create_invoice/preview_pdf.dart';
import 'package:easyinvoice/provider_code/image_provider.dart';
import 'package:easyinvoice/utils/appbar_code/appbar_code.dart';
import 'package:easyinvoice/utils/button_custom/next_button.dart';
import 'package:easyinvoice/utils/colors_class/color_class.dart';
import 'package:easyinvoice/utils/images_path/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:provider/provider.dart';


class PreviewInvoice extends StatelessWidget {
  final Uint8List? signatureBytes;
  PreviewInvoice({
    super.key,
    this.clientName,this.clientEmail,this.clientAddress,this.companyContact,
    required this.itemList,required this.priceList,this.clientMobile,this.companyName,
    this.companyAddress,this.companyEmail,required this.quantityList,
    required this.perItemTotalList,this.signatureBytes,this.total,
  });
  final List itemList, priceList, quantityList, perItemTotalList;
  dynamic clientName,clientMobile,companyName,clientEmail,clientAddress,companyAddress,
      companyEmail,total,companyContact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarCustom().appBarCustom(
        titleColor: whiteColor,
        backgroundColor: appColor,
        text: "Invoice Preview",
        leadingIconColor: whiteColor,
        icon: const Icon(Icons.arrow_back_outlined,),
        onPress1: () {Get.back();},
        useLeadingIcon: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(ImagePath.readyInvoice,
                  height: 300.0,width: 300.0,fit: BoxFit.contain,)),
            const SizedBox(height: 30.0,),
            Center(
              child: NextButton().nextButton(
                  onPress: () {generatePDF(context);},
                  text: "Your Invoice ready to View",
                  buttonColor: appColor,textColor: whiteColor,fontSize: 14.0,
                  borderRadius: BorderRadius.circular(15.0),
                  height: 50.0,
                  fontWeight: FontWeight.bold),
            ),],),),);}

  Future<void> generatePDF(BuildContext context) async {
    final pdf = pw.Document();
    final gpsIcon = pw.MemoryImage((await rootBundle.load(ImagePath.gpsIcon)).buffer.asUint8List());
    final phoneIcon = pw.MemoryImage((await rootBundle.load(ImagePath.phoneIcon)).buffer.asUint8List());
    final mailIcon = pw.MemoryImage((await rootBundle.load(ImagePath.mailIcon)).buffer.asUint8List());
    final imageFile = Provider.of<LogoProvider>(context, listen: false);
    var companyLogo;
    if (imageFile.logopath != imageFile.blankImage && imageFile.logopath.isNotEmpty) {
      var image = File(imageFile.logopath);
      companyLogo = pw.MemoryImage(image.readAsBytesSync());}
    int randomNumber = generateUniqueCode();
    DateTime currentDate = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(currentDate);

    List<pw.Widget> widgets = [];

    ///////// PDF Header/////

    final header = pw.Padding(
      padding: const pw.EdgeInsets.only(left: 50.0, right: 50.0, top: 60.0),
      child: pw.Column(children: [
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Row(children: [
            imageFile.logopath != imageFile.blankImage
                ? pw.Container(
                decoration: const pw.BoxDecoration(
                    color: PdfColors.green, shape: pw.BoxShape.circle),
                height: 40.0,
                width: 40.0,
                child: pw.Center(
                  child: pw.ClipOval(
                    child: pw.Image(companyLogo, fit: pw.BoxFit.cover),
                  ),
                ))
                : pw.SizedBox(),
            pw.SizedBox(width: 10.0),
            pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  multiText(
                    text2: companyName,
                  ),
                  multiText(
                    text2: companyAddress,
                  ),
                ]),
          ]),
          pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.end,
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text("INVOICE",
                    style: pw.TextStyle(
                        fontSize: 30.0,
                        fontWeight: pw.FontWeight.bold,
                        color: const PdfColor.fromInt(0xff242993))),
                pw.SizedBox(height: 3.0),
                pw.Text("Number:#INV$randomNumber",
                    style: const pw.TextStyle(fontSize: 12.0)),
                pw.Text("Date: $formattedDate",
                    style: const pw.TextStyle(fontSize: 12.0)),
              ]),
        ]),
        pw.SizedBox(height: 5.0),
      ]),
    );

    ////// Bill Detail //////

    final billDetails = pw.Padding(
      padding: const pw.EdgeInsets.symmetric(horizontal: 50.0),
      child: pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text("BILL TO",
                style: const pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 12.0,
                )),
            pw.Text(clientName,
                style: pw.TextStyle(fontSize: 12.0,fontWeight: pw.FontWeight.bold,
                    color: PdfColors.black)),
            pw.Text(clientEmail,
                style: const pw.TextStyle(fontSize: 12.0,)),
            pw.SizedBox(height: 20.0),
            pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(clientAddress,
                      style: const pw.TextStyle(
                        fontSize: 12.0,
                      )),
                  pw.Text(clientMobile,
                      style: const pw.TextStyle(
                        fontSize: 12.0,
                      )),
                ])
          ]),
    );

    /////// Item Header ////////

    final itemHeader = pw.Column(children: [
      pw.SizedBox(height: 20.0),
      pw.Table(columnWidths: {
        0: const pw.FixedColumnWidth(1),
        1: const pw.FixedColumnWidth(3),
        2: const pw.FixedColumnWidth(2),
        3: const pw.FixedColumnWidth(2),
        4: const pw.FixedColumnWidth(2),
      }, children: [
        pw.TableRow(
            decoration: const pw.BoxDecoration(
              color: PdfColor.fromInt(0xff242993),
            ),
            children: [
              pw.Center(
                child: pw.Container(
                  margin: const pw.EdgeInsets.only(
                      left: 40.0, top: 5.0, bottom: 5.0),
                  child: pw.Text("No",
                      style: const pw.TextStyle(color: PdfColors.white)),
                ),
              ),
              pw.Center(
                child: pw.Container(
                  margin: const pw.EdgeInsets.symmetric(
                      horizontal: 0.0,vertical: 5.0),
                  child: pw.Text("Item Details",
                      style: const pw.TextStyle(color: PdfColors.white)),
                ),
              ),
              pw.Center(
                child: pw.Container(
                  margin: const pw.EdgeInsets.symmetric(
                      horizontal: 0.0,vertical: 5.0),
                  child: pw.Text("Price",
                      style: const pw.TextStyle(color: PdfColors.white)),
                ),
              ),
              pw.Center(
                child: pw.Container(
                  margin: const pw.EdgeInsets.symmetric(
                      horizontal: 0.0,vertical: 5.0),
                  child: pw.Text("Quantity",
                      style: const pw.TextStyle(color: PdfColors.white)),
                ),
              ),
              pw.Center(
                child: pw.Container(
                  margin: const pw.EdgeInsets.only(
                      right: 10.0,
                      top: 5.0, bottom: 5.0),
                  child: pw.Text("Total",
                      style: const pw.TextStyle(color: PdfColors.white)),
                ),
              ),
            ])
      ]),
      pw.SizedBox(height: 2.0),
    ]);

    ///// Item Prices //////

    final itemsPrice = pw.Padding(
      padding: const pw.EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
      child: pw
          .Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
        pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
          if (signatureBytes != null)
            pw.Container(
              width: 100.0,
              height: 50.0,
              child: pw.Image(
                pw.MemoryImage(signatureBytes!),
                fit: pw.BoxFit.contain,
              ),
            ),
          pw.Container(
            width: 100.0,
            child: pw.Divider(thickness: 1.0, color: PdfColors.grey700),
          ),
          pw.Text(
            "Signature",
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 12.0),
          ),
        ]),
        pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
          pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
            pw.Text("Subtotal :",
                style: const pw.TextStyle(fontSize: 12.0,)),
            pw.SizedBox(width: 7.0),
            pw.Text("  $total",
                style: const pw.TextStyle(fontSize: 12.0,)),
          ]),
          pw.SizedBox(height: 10.0),
          pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
            pw.Container(
              height: 23.0,
              width: 150.0,
              decoration: const pw.BoxDecoration(
                color: PdfColor.fromInt(0xff242993),
              ),
              child: pw.Center(
                child: pw.Padding(
                  padding: const pw.EdgeInsets.all(5.0),
                  child: pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      children: [
                        pw.Text("Total :",
                            style: const pw.TextStyle(color: PdfColors.white,fontSize: 12.0)),
                        pw.SizedBox(width: 7.0),
                        pw.Text("  $total",
                            style: const pw.TextStyle(color: PdfColors.white,fontSize: 12.0,)),
                      ]),
                ),
              ),
            )
          ]),
        ])
      ]),
    );

    final companyDetails = pw.Padding(
      padding: const pw.EdgeInsets.symmetric(horizontal: 50.0),
      child:
      pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.SizedBox(
            child: companyContact != null ? pw.Row(children: [
              pw.Image(phoneIcon, height: 20.0, width: 20.0),
              pw.SizedBox(width: 20.0),
              multiText(text2: companyContact),
            ]): null),
        pw.SizedBox(height: 10.0),
        pw.SizedBox(
          child: companyEmail != null ? pw.Row(
            children: [
              pw.Image(mailIcon, height: 20.0, width: 20.0),
              pw.SizedBox(width: 20.0),
              multiText(text2: companyEmail),
            ],
          ): null,),
        pw.SizedBox(height: 10.0),
        pw.SizedBox(
          child: companyAddress != null ? pw.Row(
            children: [
              pw.Image(gpsIcon, height: 20.0, width: 20.0),
              pw.SizedBox(width: 20.0),
              multiText(text2: companyAddress),
            ],
          ): null,),
      ]),
    );

    widgets.add(header);
    widgets.add(billDetails);
    widgets.add(itemHeader);

    /////// Item Detail ///////

    final builder = pw.Container(
        child: pw.ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return pw.Table(columnWidths: {
              0: const pw.FixedColumnWidth(1),
              1: const pw.FixedColumnWidth(3),
              2: const pw.FixedColumnWidth(2),
              3: const pw.FixedColumnWidth(2),
              4: const pw.FixedColumnWidth(2),
            }, children: [
              pw.TableRow(
                  verticalAlignment: pw.TableCellVerticalAlignment.middle,
                  decoration: const pw.BoxDecoration(color: PdfColors.white),
                  children: [
                    pw.Center(
                        child: pw.Container(
                          margin: const pw.EdgeInsets.only(left: 40.0,top: 5.0,bottom: 5.0),
                          child: pw.Text("${index + 1}",
                              style: const pw.TextStyle(color: PdfColors.black)),
                        )),
                    pw.Center(
                        child: pw.Container(
                          margin: const pw.EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: pw.Text(itemList[index],
                              style: const pw.TextStyle(color: PdfColors.black)),
                        )),
                    pw.Center(
                        child: pw.Container(
                          margin: const pw.EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: pw.Text(priceList[index].toString(),
                              style: const pw.TextStyle(color: PdfColors.black)),
                        )),
                    pw.Center(
                        child: pw.Container(
                          margin: const pw.EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: pw.Text(quantityList[index].toString(),
                              style: const pw.TextStyle(color: PdfColors.black)),
                        )),
                    pw.Center(
                        child: pw.Container(
                          margin: const pw.EdgeInsets.only(left: 10.0,top: 5.0,bottom: 5.0),
                          child: pw.Text(" ${perItemTotalList[index]}",
                              style: const pw.TextStyle(color: PdfColors.black)),
                        )),
                    pw.SizedBox(height: 2.0),
                  ]),
            ]);
          },
        ));

    widgets.add(builder);
    widgets.add(itemsPrice);
    widgets.add(companyDetails);

    pdf.addPage(pw.MultiPage(
        margin: const pw.EdgeInsets.all(0.0),
        pageFormat: PdfPageFormat.a4,
        build: (context) => widgets));

    Get.to(PreviewPdf(
      doc: pdf,
    ));
  }

  int generateUniqueCode() {
    var random = Random();
    int code = (100000 + random.nextInt(900000));
    return code;
  }

  pw.RichText multiText({var text2}) {
    return pw.RichText(
      text: pw.TextSpan(children: [
        pw.TextSpan(text: text2,
            style: pw.TextStyle(color: PdfColors.black,
                fontWeight: pw.FontWeight.bold,fontSize: 14.0)),]),
    );
  }
}
