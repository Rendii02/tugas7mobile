import 'package:flutter/material.dart';

class Product{
  final String nama, gambar;
 
  Product(this.nama,this.gambar);
}

class CartModel extends ChangeNotifier{
  final List<Product> _items = [];

  List<Product> get items => _items;
  int get totalItems => items.length;

  void add(Product products){
_items.add(products);
  notifyListeners();
}

  void removeAt(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

}
