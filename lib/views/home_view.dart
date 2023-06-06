import 'package:flutter/material.dart';
import 'package:meddis/views/components/custom_search_bar.dart';
import 'package:meddis/views/utils/custom_text_style.dart';

import 'components/header_logo.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderLogo(),
              const SizedBox(height: 10),
              Text("Cari Obat", style: CustomTextStyle.headerStyle),
              const SizedBox(height: 10),
              const CustomSearchBar(),
              const SizedBox(height: 10),
              Text("Menu", style: CustomTextStyle.headerStyle),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
