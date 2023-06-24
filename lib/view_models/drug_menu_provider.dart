import 'package:flutter/material.dart';
import 'package:meddis/views/home_view.dart';
import 'package:meddis/views/profile_view.dart';

class DrugMenuProvider with ChangeNotifier {
  int _index = 0;
  int get index => _index;

  List<Widget> body = [
    const HomeView(),
    const ProfileView(),
  ];

  void selectDestination(int value) {
    _index = value;
    notifyListeners();
  }
}
