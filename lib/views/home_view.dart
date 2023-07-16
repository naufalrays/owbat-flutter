import 'package:flutter/material.dart';
import 'package:meddis/views/components/custom_search_bar.dart';
import 'package:meddis/views/components/menu_card.dart';
import 'package:meddis/views/drugs/main_drug_view.dart';
import 'package:meddis/utils/custom_text_style.dart';
import 'package:meddis/views/notes/main_note_view.dart';

import 'components/header_logo.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const CustomSearchBar(
                hintText: "Paracetamol",
              ),
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
                    MenuCard(
                      imageSize: 80,
                      fontSize: 16,
                      title: "Database Obat",
                      images: "assets/images/menu_list_drugs.png",
                      onTap: () => logicDrugs(context),
                    ),
                    // Custom Menu Card 2
                    MenuCard(
                      fontSize: 16,
                      title: "Catatan",
                      images: "assets/images/menu_notes.png",
                      isPrimaryColors: false,
                      onTap: () => logicNote(context),
                    ),
                    // Custom Menu Card 3
                    MenuCard(
                      fontSize: 16,
                      title: "Pengingat Obat",
                      images: "assets/images/menu_reminder.png",
                      isPrimaryColors: false,
                      onTap: () {},
                    ),
                    // Custom Menu Card 4
                    MenuCard(
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

  // Logic Button Drugs Menu
  void logicDrugs(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MainDrugView(),
      ),
    );
  }

  // Logic Button Notes Menu
  void logicNote(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MainNoteView(),
      ),
    );
  }
}
