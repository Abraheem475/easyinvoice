import 'package:flutter/foundation.dart';
import '../../utils/items_details/items_controller.dart';

class ItemProvider with ChangeNotifier {
  List<ItemController> itemController = [];

  final List _items = [];
  final List _unitPrice = [];
  final List _unit = [];
  final List _quantity = [];
  final List _category = [];
  final List _description = [];
  final List _perItemTotalAmount = [];
  double _subTotal = 0;

  get items => _items;
  get description => _description;
  get quantity => _quantity;
  get category => _category;
  get unitPrice => _unitPrice;
  get unit => _unit;
  get perItemTotalAmount => _perItemTotalAmount;
  get subTotal => _subTotal;

  void itemAdd(addItem,  addQuantity,
      addCategory,addDescription, addUnitPrice, addUnit, perItemTotalAmount) {
    _items.add(addItem);
    _unitPrice.add(addUnitPrice);
    _unit.add(addUnit);
    _quantity.add(addQuantity);
    _description.add(addDescription);
    _category.add(addCategory);
    _perItemTotalAmount.add(perItemTotalAmount);
    notifyListeners();
  }
  itemUpdate(int index, quantity, category,item, description, unitPrice, unit,  perItemTotalAmount) {
    _items[index] = item;
    _unit[index] = unit;
    _quantity[index] = quantity;
    _category[index] = category;
    _description[index] = description;
    _unitPrice[index] = unitPrice;
    _perItemTotalAmount[index] = perItemTotalAmount;
    notifyListeners();
  }

  void itemsRemove(int index) {
    _items.removeAt(index);
    _unitPrice.removeAt(index);
    _unit.removeAt(index);
    _quantity.removeAt(index);
    _description.removeAt(index);
    _category.removeAt(index);
    _perItemTotalAmount.removeAt(index);
    notifyListeners();
  }

  void clearData() {
    _items.clear();
    _unit.clear();
    _quantity.clear();
    _category.clear();
    _description.clear();
    _unitPrice.clear();
    _perItemTotalAmount.clear();
    notifyListeners();
  }

  double totalCalculate() {
    _subTotal = 0;
    for (int i = 0; i < perItemTotalAmount.length; i++) {
      _subTotal += double.tryParse(perItemTotalAmount[i])!;
    }
    return _subTotal;
  }
}

