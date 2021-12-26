import 'package:flutter/material.dart';

import 'package:cacapp/ui/input_decorations.dart';

import 'package:cacapp/screen/screens.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    // final LoginFormProvider provider = Provider.of<LoginFormProvider>(context);

    return Container(
        // key: provider.formKey,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
      children: [
        TextField(
          controller: _emailController,
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecorations.authInputDecoration(
            hintText: 'mail@example.net',
            labelText: 'Email address',
            prefixIcon: Icons.alternate_email,
          ),
          // validator: (value) {
          //   String pattern =
          //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
          //   RegExp regExp = RegExp(pattern);
          //   return regExp.hasMatch(value ?? '')
          //       ? null
          //       : 'Not valid email address';
          // },
        ),
        const SizedBox(height: 30),
        TextField(
          controller: _passwordController,
          autocorrect: false,
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecorations.authInputDecoration(
            hintText: '********',
            labelText: 'Password',
            prefixIcon: Icons.lock_outline,
          ),
          // validator: (value) {
          //   String pass = (value ?? '');
          //   return pass.isNotEmpty && pass.length > 6
          //       ? null
          //       : 'Password of at least 6 characters required';
          // },
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            // if (provider.isValidForm()) {
            _emailController.text = '';
            _passwordController.text = '';
            Navigator.pushNamed(context, HomeScreen.route);
            // }
          },
          child: Row(
            children: const [
              Expanded(
                child: Center(
                  child: Text('Login'),
                ),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            onPrimary: Colors.white,
            minimumSize: const Size(100, 50),
          ),
        ),
      ],
    ));
  }
}
