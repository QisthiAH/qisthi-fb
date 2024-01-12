part of '_index.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: FutureBuilder(
        future: getDoc(id),
        builder: (context, snapshot) => snapshot.hasData
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('id : ${snapshot.data!['id']}'),
                    Text('nama : ${snapshot.data!['nama']}'),
                    Text('harga : RP ${snapshot.data!['harga'].toString()}'),
                    Text('stok : ${snapshot.data!['stok'].toString()}'),
                    Text('tanggal pembuatan : ${snapshot.data!['created_at'].toString()}'),
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
