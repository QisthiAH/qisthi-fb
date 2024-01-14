part of '_index.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  void initState() {
    loadmore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout, color: Colors.white),
          ),
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.currentUser!.delete();
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.dangerous_outlined,
              color: Colors.white,
            ),
          ),
        ],
        automaticallyImplyLeading: false,
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
                          Center(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                ...List.generate(
                                  userList.length,
                                  (index) {
                                    final data = userList[index];
                                    final id = data.id;
                                    return GestureDetector(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 200,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Column(
                                            children: [
                                              const SizedBox(height: 10),
                                              SizedBox(width: 100, height: 100, child: Image.network(data.imageUrl)),
                                              const SizedBox(height: 10),
                                              Text(
                                                data.nama,
                                                style: const TextStyle(color: Colors.black),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                'Rp ${data.harga.toString()}',
                                                style: const TextStyle(color: Colors.black),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => UserDetail(id: id)),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
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
