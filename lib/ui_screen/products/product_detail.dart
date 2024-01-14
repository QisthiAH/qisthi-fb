part of '_index.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductEdit(id: widget.id)),
              );
            },
            child: const Icon(Icons.edit),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              setState(() {});
            },
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getDoc(widget.id),
        builder: (context, snapshot) => snapshot.hasData
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 100, height: 100, child: Image.network(snapshot.data!.imageUrl)),
                    const SizedBox(height: 10),
                    Text('id : ${snapshot.data!.id}'),
                    Text('nama : ${snapshot.data!.nama}'),
                    Text('harga : Rp ${snapshot.data!.harga.toString()}'),
                    Text('stok : ${snapshot.data!.stok.toString()}'),
                    Text('tanggal pembuatan : ${snapshot.data!.createdAt.toString()}'),
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
