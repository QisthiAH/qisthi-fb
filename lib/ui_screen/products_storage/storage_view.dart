part of '_index.dart';

class StorageView extends StatefulWidget {
  const StorageView({super.key});

  @override
  State<StorageView> createState() => _StorageViewState();
}

class _StorageViewState extends State<StorageView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        pickedImage == null
            ? Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    'no image',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              )
            : SizedBox(
                height: 100,
                width: 100,
                child: Image.network('${pickedImage?.path}'),
              ),
        // SizedBox(
        //   height: 100,
        //   width: 100,
        //   child: Center(
        //     child: pickedImage == null
        //         ? const Text(
        //             'no image',
        //             style: TextStyle(fontSize: 15),
        //           )
        //         : Image.network('${pickedImage?.path}'),
        //   ),
        // ),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: () async {
            pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
            setState(() {});
          },
          child: const Text('pick image from gallery'),
        )
      ],
    );
  }
}
