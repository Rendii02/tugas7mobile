import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas7/cart_model.dart';
import 'package:tugas7/cart_page.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final products = [
    Product(
      'Laptop',
      'https://plus.unsplash.com/premium_photo-1681302547899-9339f12aca53?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    ),
    Product(
      'Mouse',
      'https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    ),
    Product(
      'Monitor',
      'https://images.unsplash.com/photo-1551645120-d70bfe84c826?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F2),
      appBar: AppBar(
        title: const Text(
          'Daftar Produk',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Badge(
                  label: Text('${cart.totalItems}'),
                  isLabelVisible: cart.totalItems > 0,
                  backgroundColor: CupertinoColors.destructiveRed ,
                  textColor: const Color(0xFF263328),
                  child: IconButton(
                    tooltip: 'Buka keranjang',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Produk pilihan',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF263328),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Temukan perangkat untuk kebutuhanmu',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                  itemCount: products.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return Card(
                      margin: EdgeInsets.zero,
                      color: Colors.white,
                      elevation: 1,
                      shadowColor: const Color(0x1A1B5E20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: Color(0xFFE8EEE6)),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            product.gambar,
                            fit: BoxFit.cover,
                            width: 82,
                            height: 72,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 82,
                                height: 72,
                                color: const Color(0xFFE5F1E3),
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.image_not_supported_outlined,
                                  color: Color(0xFF718071),
                                ),
                              );
                            },
                          ),
                        ),
                        title: Text(
                          product.nama,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF263328),
                          ),
                        ),
                        trailing: IconButton.filled(
                          tooltip: 'Tambah ke keranjang',
                          onPressed: () {
                            Provider.of<CartModel>(
                              context,
                              listen: false,
                            ).add(product);
                          },
                          style: IconButton.styleFrom(
                            backgroundColor: const Color(0xFFE5F1E3),
                            foregroundColor: Colors.black,
                          ),
                          icon: const Icon(Icons.add_shopping_cart),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
