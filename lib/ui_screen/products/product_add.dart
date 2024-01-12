part of '_index.dart';

class ProductAdd extends StatefulWidget {
  const ProductAdd({super.key});

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Add'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: ctrlNamaProduk,
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
                focusedBorder: const OutlineInputBorder(borderSide: BorderSide()),
                enabledBorder: const OutlineInputBorder(borderSide: BorderSide()),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: ctrlHargaProduk,
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
                focusedBorder: const OutlineInputBorder(borderSide: BorderSide()),
                enabledBorder: const OutlineInputBorder(borderSide: BorderSide()),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: ctrlStokProduk,
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
                focusedBorder: const OutlineInputBorder(borderSide: BorderSide()),
                enabledBorder: const OutlineInputBorder(borderSide: BorderSide()),
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () async {
                final valNama = ctrlNamaProduk.text;
                final valHarga = int.parse(ctrlHargaProduk.text);
                final id = UniqueKey().toString();
                final valStok = int.parse(ctrlStokProduk.text);
                final newProduct = ProductX(
                  nama: valNama,
                  harga: valHarga,
                  id: id,
                  stok: valStok,
                  createdAt: DateTime.now().toString(),
                );
                setState(() {
                  isLoading = true;
                });
                await create(newProduct);
                ctrlNamaProduk.clear();
                ctrlHargaProduk.clear();
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
      ),
    );
  }
}
