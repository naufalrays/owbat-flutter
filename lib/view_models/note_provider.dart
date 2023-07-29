import 'package:flutter/material.dart';

class NoteProvider extends ChangeNotifier {
  bool _isGrid = false;
  bool get isGrid => _isGrid;

  void changeNotesView(bool isGridParam) {
    _isGrid = !isGridParam;
    notifyListeners();
  }
}
