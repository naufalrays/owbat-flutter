import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/scanner_provider.dart';
import '../../components/custom_button.dart';

void showAlertDialog(BuildContext context) {
  final prof = Provider.of<ScannerProvider>(context, listen: false);
  showDialog(
    context: context,
    builder: (context) {
      final size = MediaQuery.of(context).size;
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        backgroundColor: Colors.white,
        content: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                marginTop: 5,
                marginBottom: 0,
                width: size.width * 0.58,
                height: 40,
                onPressed: () => prof.pickImage(isCamera: true),
                text: "Scan with Camera",
              ),
              CustomButton(
                marginTop: 10,
                marginBottom: 0,
                width: size.width * 0.58,
                height: 40,
                secondaryColor: true,
                onPressed: () => prof.pickImage(isCamera: false),
                text: "Scan with Gallery",
              ),
            ],
          ),
        ),
      );
    },
  );
}
