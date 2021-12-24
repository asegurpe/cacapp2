import 'package:cacapp/screen/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String route = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Center(child: Text('Login')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'CacApp',
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
                        image: AssetImage('assets/images/button/lock.png')),
                  ),
                  Expanded(child: Center(child: Text('Login with email'))),
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                minimumSize: const Size(10, 50),
              ),
            ),
            TextButton(onPressed: () {}, child: Text('I forgot password')),
            const SizedBox(height: 4),
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
                        image: AssetImage('assets/images/button/google.png')),
                  ),
                  Expanded(child: Center(child: Text('Sign up with Google'))),
                ],
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  minimumSize: const Size(100, 50),
                  side: BorderSide(
                    width: 1.0,
                    color: Colors.black,
                  )),
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
                        image: AssetImage('assets/images/button/apple.png')),
                  ),
                  Expanded(child: Center(child: Text('Sign in with Apple'))),
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.white,
                minimumSize: const Size(100, 50),
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
                        image: AssetImage('assets/images/button/email.png')),
                  ),
                  Expanded(child: Center(child: Text('Register with email'))),
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                onPrimary: Colors.black,
                minimumSize: const Size(100, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
