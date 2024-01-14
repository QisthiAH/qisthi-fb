part of '_index.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  void initState() {
    loadmore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout),
          ),
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.currentUser!.delete();
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            icon: const Icon(Icons.dangerous_outlined),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {});
            },
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductAdd()),
              );
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getColl(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? userList.isEmpty
                  ? const Center(child: Text('data is empty'))
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(
                            userList.length,
                            (index) {
                              final data = userList[index];
                              final id = data.id;
                              return Card(
                                child: ListTile(
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () async {
                                          final updateProd = ProductX(
                                            createdAt: data.createdAt,
                                            id: data.id,
                                            nama: WordPair.random().toString(),
                                            harga: 34000,
                                            stok: 12,
                                          );
                                          await update(updateProd);
                                          setState(() {});
                                        },
                                        icon: const Icon(Icons.update),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          await delete(id);
                                          setState(() {});
                                        },
                                        icon: const Icon(Icons.delete),
                                      ),
                                    ],
                                  ),
                                  leading: Image.network(data.imageUrl),
                                  title: Text(data.nama),
                                  subtitle: Text('Rp ${data.harga.toString()}'),
                                  selected: selectedId == id,
                                  onTap: () {
                                    setState(() {
                                      selectedId = id;
                                    });
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ProductDetail(id: id)),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          isEnd
                              ? const Text('end of product')
                              : snapshot.connectionState == ConnectionState.waiting
                                  ? const CircularProgressIndicator()
                                  : OutlinedButton(
                                      onPressed: () {
                                        setState(() {
                                          loadmore();
                                        });
                                      },
                                      child: const Text('load more'),
                                    )
                        ],
                      ),
                    )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
