part of '_index.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({
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
