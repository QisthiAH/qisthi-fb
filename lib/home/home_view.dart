part of '_index.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'walking bookstore',
            style: GoogleFonts.grapeNuts(
              fontSize: 35,
              color: const Color(0xffbb86fc),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const GitHub(),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductView()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FaIcon(FontAwesomeIcons.addressBook),
                    SizedBox(width: 10),
                    Text('admin page'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const AuthView(),
          ],
        ),
      ),
    );
  }
}
