import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [const HeaderBackground(), const HeaderIcon(), child],
      ),
    );
  }
}

class HeaderBackground extends StatelessWidget {
  const HeaderBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      // color: Color.fromRGBO(155, 103, 60, 0.75),
      decoration: const BoxDecoration(
        color: Colors.white,
        // border: Border.all(color: Colors.black),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(0, 3),
          ),
        ],
      ),
    );
  }
}

class HeaderIcon extends StatelessWidget {
  const HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: Image(
          image: AssetImage('assets/images/button/place.png'),
          height: 100,
        ),
      ),
    );
  }
}
