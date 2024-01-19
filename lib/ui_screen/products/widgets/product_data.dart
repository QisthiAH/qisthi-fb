part of '_index.dart';

final ctrlNamaProduk = TextEditingController();
final ctrlHargaProduk = TextEditingController();
final ctrlStokProduk = TextEditingController();
var isLoading = false;
var isShowClear1 = false;
var isShowClear2 = false;
var isShowClear3 = false;
var isEnd = false;
String selectedId = '';
List<ProductX> userList = [];

final editNamaProduk = TextEditingController(text: product!.nama);
final editHargaProduk = TextEditingController(text: product!.harga.toString());
final editStokProduk = TextEditingController(text: product!.stok.toString());
ProductX? product;
