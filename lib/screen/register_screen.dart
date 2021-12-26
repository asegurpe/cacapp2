import 'package:flutter/material.dart';

import 'package:cacapp/screen/screens.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static const String route = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Image.asset('assets/images/button/back.png'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text('Register'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'New user',
              style: TextStyle(fontSize: 40),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            TextField(
              controller: _repasswordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Re-password',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.route);
              },
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Image(
                        height: 25,
                        image: AssetImage('assets/images/button/checked.png')),
                  ),
                  Expanded(child: Center(child: Text('Confirm'))),
                ],
              ),
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                minimumSize: const Size(10, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
