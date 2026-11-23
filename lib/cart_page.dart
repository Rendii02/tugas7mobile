import 'package:flutter/material.dart';
import 'package:tugas7/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F2),
      appBar: AppBar(
        title: const Text(
          'Keranjang Anda',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: const BoxDecoration(
                        color: Color(0xFFE5F1E3),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        size: 52,
                        color: Colors.cyan,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Keranjang masih kosong',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF263328),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Produk yang kamu tambahkan akan muncul di sini.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Color(0xFF718071)),
                    ),
                  ],
                ),
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Produk pilihanmu',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF263328),
                      ),
                    ),
                    Text(
                      '${cart.totalItems} item',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF718071),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                  itemCount: cart.items.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final product = cart.items[index];

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
                            width: 72,
                            height: 68,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 72,
                                height: 68,
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
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF263328),
                          ),
                        ),
                        trailing: TextButton.icon(
                          onPressed: () => cart.removeAt(index),
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFFC62828),
                            backgroundColor: const Color(0xFFFFF0F0),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: const Icon(Icons.delete_outline, size: 18),
                          label: const Text('Hapus'),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
