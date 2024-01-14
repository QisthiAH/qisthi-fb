part of '_index.dart';

Future<List<ProductX>> getColl() async {
  List<ProductX> users = [];
  final result = await FirebaseFirestore.instance
      .collection('productName')
      .limit(3)
      .orderBy('created_at', descending: true)
      .startAfter([userList.isEmpty ? '9999-99-99' : userList.last.createdAt]).get();
  // await FirebaseStorage.instance.ref().getDownloadURL();
  for (var element in result.docs) {
    users.add(ProductX.fromMap(element.data()));
  }
  return users;
}

Future<DocumentSnapshot<Map<String, dynamic>>> getDoc(String id) async {
  final result = await FirebaseFirestore.instance.collection('productDetail').doc(id).get();
  return result;
}

Future<void> create(ProductX data) async {
  final map = data.toMap();
  final docId = data.id;
  final nama = data.nama;
  final createdAt = data.createdAt;
  final imageUrl = data.imageUrl;
  final harga = data.harga;
  await FirebaseFirestore.instance
      .collection('productName')
      .doc(docId)
      .set({'nama': nama, 'id': docId, 'created_at': createdAt, 'image_url': imageUrl, 'harga': harga});
  await FirebaseFirestore.instance.collection('productDetail').doc(docId).set(map);
  userList.insert(0, data);
}

Future<void> update(ProductX updateProduct) async {
  final map = updateProduct.toMap();
  final docId = updateProduct.id;
  final nama = updateProduct.nama;
  final createdAt = updateProduct.createdAt;
  await FirebaseFirestore.instance
      .collection('productName')
      .doc(docId)
      .set({'nama': nama, 'id': docId, 'created_at': createdAt});
  await FirebaseFirestore.instance.collection('productDetail').doc(docId).set(map);
  final index = userList.indexWhere((element) => element.id == docId);
  userList[index] = updateProduct;
}

Future<void> loadmore() async {
  final dataColl = await getColl();
  userList.addAll(dataColl);
  if (dataColl.length < 3) {
    isEnd = true;
  }
}

Future delete(String id) async {
  var docId = id;
  await FirebaseFirestore.instance.collection('productName').doc(docId).delete();
  await FirebaseFirestore.instance.collection('productDetail').doc(docId).delete();
  await FirebaseStorage.instance.ref(id).delete();
  final index = userList.indexWhere((element) => element.id == id);
  userList.removeAt(index);
}
