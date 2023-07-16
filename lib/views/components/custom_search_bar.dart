import 'package:flutter/material.dart';
import 'package:meddis/views/components/search_bar_after.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  final String hintText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: TextFormField(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SearchBarAfter(
            topic: "Catatan",
          ),
        )),
        showCursor: false,
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: const Icon(
            Icons.search,
            size: 24,
          ),
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
            vertical: size.height * 7 / 400,
            horizontal: size.width * 1 / 45,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 0.0,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 0.0,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
