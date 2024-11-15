import 'package:flutter/material.dart';

class SimpleInfoContainer extends StatelessWidget {
 
  final String? text1;
  final String? text2;
  final String? text3;
  final String? text4;
  final Color? backgroundColor; 
  final Color? textColor; 

  const SimpleInfoContainer({
    Key? key,
    this.text1,
    this.text2,
    this.text3,
    this.text4,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(15.0), 
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 30), 
            if (text1 != null) Text(text1!, style: TextStyle(color: textColor ?? Color(0xff2E302D))),
            if (text2 != null) Text(text2!, style: TextStyle(color: textColor ?? Color(0xff2E302D))),
            if (text3 != null) Text(text3!, style: TextStyle(color: textColor ?? Color(0xff2E302D))),
            if (text4 != null) Text(text4!, style: TextStyle(color: textColor ?? Color(0xff2E302D))),
          ],
        ),
      ),
    );
  }
}
