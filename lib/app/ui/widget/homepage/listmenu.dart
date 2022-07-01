import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget buildMenu() {
  return SingleChildScrollView(
    padding: EdgeInsets.only(
      right: 50,
      top: 20,
      left: 20,
      bottom: 20,
    ),
    child: Column(children: [
      const ClipOval(
        child: FadeInImage(
          placeholder: AssetImage('assets/image_placeholder.png'),
          image: AssetImage('assets/image_placeholder.png'),
          fit: BoxFit.cover,
          height: 120,
          width: 120,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        "Olivia Jensen",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: HexColor('FFFFFF'),
        ),
      ),
      Text(
        "olivia@gmail.com",
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: HexColor('FFFFFF'),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Container(
        height: 1,
        color: HexColor('FFFFFF').withOpacity(0.4),
      ),
      const SizedBox(
        height: 10,
      ),
      ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () {},
        leading: Icon(
          Icons.person,
          size: 28.0,
          color: HexColor('FFFFFF'),
        ),
        title: Align(
          alignment: const Alignment(-1.2, 0),
          child: Text(
            "Profile",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: HexColor('FFFFFF'),
            ),
          ),
        ),
        textColor: Colors.white,
        dense: true,
      ),
      ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () {},
        leading: Icon(
          Icons.login,
          size: 28.0,
          color: HexColor('FFFFFF'),
        ),
        title: Align(
          alignment: const Alignment(-1.2, 0),
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: HexColor('FFFFFF'),
            ),
          ),
        ),
        textColor: Colors.white,
        dense: true,
      ),
    ]),
  );
}
