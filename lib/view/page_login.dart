import 'package:flutqustion/view/quize_app.dart';
import 'package:flutter/material.dart';

TextEditingController email = TextEditingController();

TextEditingController password = TextEditingController();

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Image.asset('asset/imagebig.png'),
            Positioned(
              left: 45,
              child: Image.asset('asset/imagethree.png'),
            ),
            Positioned(
              child: Image.asset('asset/imagetow.png'),
            ),
            Positioned(
              top: 150,
              left: 30,
              child: Image.asset('asset/imagefour.png'),
            ),
            Positioned(
              top: 20,
              left: 230,
              child: Image.asset('asset/imagefive.png'),
            ),
            const Positioned(
              top: 110,
              left: 140,
              child: Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xff8D376F),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email, color: Color(0xFF8D376F)),
                hintText: 'user@gmail.com',
                hintStyle: const TextStyle(color: Color(0xFF8D376F)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Color(0xFF8D376F)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Color(0xFF8D376F)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Color(0xFF8D376F)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock, color: Color(0xFF8D376F)),
                hintText: 'password',
                hintStyle: const TextStyle(color: Color(0xFF8D376F)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Color(0xFF8D376F)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Color(0xFF8D376F)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Color(0xFF8D376F)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: InkWell(
              child: Container(
                height: 59,
                width: 387,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                      colors: [Color(0xffDA8BD9), Color(0xFFeea849)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: const Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              onTap: () {
                if (email.text == 'ammar@gmail.com' &&
                    password.text == '12345') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      showCloseIcon: true,
                      action: SnackBarAction(label: 'Undo', onPressed: () {}),
                      duration: const Duration(seconds: 1),
                      behavior: SnackBarBehavior.floating,
                      content: const Text("Success"),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const QuizApp()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      showCloseIcon: true,
                      action: SnackBarAction(label: 'Undo', onPressed: () {}),
                      duration: const Duration(seconds: 1),
                      behavior: SnackBarBehavior.floating,
                      content: const Text("Not Auth"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
