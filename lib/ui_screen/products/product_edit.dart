import 'package:flutter/material.dart';
import 'package:qisthi_fb/models/product.dart';
import 'package:qisthi_fb/ui_screen/products/widgets/_index.dart';
import 'package:qisthi_fb/ui_screen/products_storage/_index.dart';
import 'package:qisthi_fb/ui_screen/products_storage/widgets/storage_ctrl.dart';

class ProductEdit extends StatefulWidget {
  const ProductEdit({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  State<ProductEdit> createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Edit'),
      ),
      body: FutureBuilder(
        future: getDoc(widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const StorageView(),
                  const SizedBox(height: 20),
                  TextField(
                    controller: editNamaProduk,
                    onChanged: (value) {
                      setState(() {
                        isShowClear1 = value.isNotEmpty;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'masukkan nama produk',
                      labelText: 'nama produk',
                      suffixIcon: isShowClear1
                          ? IconButton(
                              onPressed: () {
                                ctrlNamaProduk.clear();
                                setState(() {
                                  isShowClear1 = false;
                                });
                              },
                              icon: const Icon(Icons.clear),
                            )
                          : null,
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: editHargaProduk,
                    onChanged: (value) {
                      setState(() {
                        isShowClear2 = value.isNotEmpty;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'exp 10000',
                      labelText: 'harga produk',
                      suffixIcon: isShowClear2
                          ? IconButton(
                              onPressed: () {
                                ctrlHargaProduk.clear();
                                setState(() {
                                  isShowClear2 = false;
                                });
                              },
                              icon: const Icon(Icons.clear),
                            )
                          : null,
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: editStokProduk,
                    onChanged: (value) {
                      setState(() {
                        isShowClear3 = value.isNotEmpty;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'exp.1000',
                      labelText: 'stok produk',
                      suffixIcon: isShowClear3
                          ? IconButton(
                              onPressed: () {
                                ctrlStokProduk.clear();
                                setState(() {
                                  isShowClear2 = false;
                                });
                              },
                              icon: const Icon(Icons.clear),
                            )
                          : null,
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () async {
                      final id = snapshot.data!.id;
                      final dwUrl = await uploadImage(id);
                      final valNama = editNamaProduk.text;
                      final valHarga = int.parse(editHargaProduk.text);
                      final valStok = int.parse(editStokProduk.text);
                      final newProduct = ProductX(
                        imageUrl: dwUrl,
                        nama: valNama,
                        harga: valHarga,
                        id: id,
                        stok: valStok,
                        createdAt: DateTime.now().toString(),
                      );
                      setState(() {
                        isLoading = true;
                      });
                      await update(newProduct);

                      ctrlNamaProduk.clear();
                      ctrlHargaProduk.clear();
                      ctrlStokProduk.clear();
                      setState(() {
                        isLoading = false;
                      });
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    },
                    child: Text(isLoading ? 'loading...' : 'submit'),
                  )
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
