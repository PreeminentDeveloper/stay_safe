import 'package:flutter/material.dart';

class FormTest extends StatelessWidget {

  final symptom;
  final Widget icon;
  final Function onTap;

  FormTest({this.symptom, this.icon, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            symptom,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20.0,
                // fontWeight: FontWeight.bold,
                color: Color.fromRGBO(73, 50, 155, 1.0),
                letterSpacing: 1),
          ),
          GestureDetector(
            child: icon,
            onTap: onTap,
          )
        ],
      ),
    );
  }
}