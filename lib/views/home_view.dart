import 'package:flutter/material.dart';
import 'package:meddis/views/components/custom_search_bar.dart';
import 'package:meddis/views/components/menu_cards.dart';
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
              // Header MedDis
              const HeaderLogo(),
              const SizedBox(height: 10),
              // Text Cari Obat
              Text("Cari Obat", style: CustomTextStyle.headerStyle),
              const SizedBox(height: 10),
              // Custom Search Bar
              const CustomSearchBar(),
              const SizedBox(height: 10),
              // Text Menu
              Text("Menu", style: CustomTextStyle.headerStyle),
              const SizedBox(height: 10),
              // Grid Menu Cards
              Expanded(
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 0.72,
                  children: <Widget>[
                    // Custom Menu Card
                    MenuCards(
                      imageSize: 80,
                      fontSize: 16,
                      title: "Database Obat",
                      images: "assets/images/menu_list_drugs.png",
                      onTap: () {},
                    ),
                    MenuCards(
                      fontSize: 16,
                      title: "Catatan",
                      images: "assets/images/menu_notes.png",
                      isPrimaryColors: false,
                      onTap: () {},
                    ),
                    MenuCards(
                      fontSize: 16,
                      title: "Pengingat Obat",
                      images: "assets/images/menu_reminder.png",
                      isPrimaryColors: false,
                      onTap: () {},
                    ),
                    MenuCards(
                      fontSize: 16,
                      title: "Obat Berbahaya",
                      images: "assets/images/menu_dangerous_drug.png",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
