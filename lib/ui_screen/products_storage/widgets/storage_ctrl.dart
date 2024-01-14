import 'package:firebase_storage/firebase_storage.dart';
import 'package:qisthi_fb/ui_screen/products_storage/widgets/storage_data.dart';

Future<String> uploadImage(String id) async {
  // final namaFoto = id;
  final typeFoto = pickedImage?.mimeType;
  final imageByte = await pickedImage!.readAsBytes();
  final metaData = SettableMetadata(contentType: typeFoto);
  final uploadImage = await FirebaseStorage.instance.ref(id).putData(imageByte, metaData);
  imageUrl = await uploadImage.ref.getDownloadURL();
  pickedImage = null;
  return imageUrl;
}
