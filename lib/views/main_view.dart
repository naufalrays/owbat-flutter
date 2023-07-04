import 'package:flutter/material.dart';
import 'package:meddis/view_models/main_provider.dart';
import 'package:meddis/view_models/scanner_provider.dart';
import 'package:meddis/views/components/custom_button.dart';
import 'package:meddis/views/utils/color.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, data, _) {
      return Scaffold(
        body: data.body[data.index],
        backgroundColor: const Color(0xFFF5F5F5),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showAlertDialog(context);
          },
          backgroundColor: const Color(0xFFFFFFFF),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
          ),
          child: Image.asset("assets/images/drug_scan.png", height: 32),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          surfaceTintColor: const Color(0xFFFFFFFF),
          notchMargin: 9.0,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // const Icon(Icons.percent),
              IconButton(
                // splashColor: Colors.transparent,
                // highlightColor: Colors.transparent,
                color: data.index == 0 ? MyColor.primary : MyColor.grey,
                icon: const Icon(Icons.home),
                iconSize: 32,
                onPressed: () {
                  // index = 0;
                  data.selectDestination(0);
                },
              ),
              IconButton(
                // highlightColor: Colors.transparent,
                color: data.index == 1 ? MyColor.primary : MyColor.grey,
                icon: const Icon(Icons.person),
                iconSize: 32,
                onPressed: () {
                  data.selectDestination(1);
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  void showAlertDialog(BuildContext context) {
    final prof = Provider.of<ScannerProvider>(context, listen: false);
    showDialog(
      context: context,
      builder: (context) {
        final size = MediaQuery.of(context).size;
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
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
}
