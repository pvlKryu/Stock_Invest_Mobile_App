import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: const <Widget>[
          Text(
            'Ваш профиль',
            style: TextStyle(fontSize: 25, color: Colors.black),
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
          ),
        ],
      ),
    );
  }
}
