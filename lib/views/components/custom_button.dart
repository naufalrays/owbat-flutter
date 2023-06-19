import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.onPressed,
    this.height = 55,
    this.width = double.infinity,
    this.text = 'Button',
    this.marginTop = 25,
    this.marginBottom = 15,
    this.secondaryColor = false,
    this.shape = 40,
  }) : super(key: key);
  final Function()? onPressed;
  final double height;
  final double width;
  final String text;
  final double marginTop;
  final double marginBottom;
  final bool secondaryColor;
  final double shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(top: marginTop, bottom: marginBottom),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: secondaryColor ? Colors.white : Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(shape),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: secondaryColor ? const Color(0xFF008080) : Colors.white,
          ),
        ),
      ),
    );
  }
}
