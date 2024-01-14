part of '_index.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            return Column(
              children: [
                OutlinedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signInAnonymously();
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProductView()),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 10),
                        Text('Login anonymous'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () async {
                    final provider = GoogleAuthProvider().setCustomParameters({'prompt': 'select_account'});
                    await FirebaseAuth.instance.signInWithPopup(provider);
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProductView()),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FaIcon(FontAwesomeIcons.google),
                        SizedBox(width: 10),
                        Text('Login with google'),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
