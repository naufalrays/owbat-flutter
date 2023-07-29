import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:meddis/view_models/drug_menu_provider.dart';
import 'package:meddis/views/components/custom_search_bar.dart';
import 'package:meddis/views/drugs/components/drug_category_card.dart';
import 'package:meddis/views/drugs/drug_list_view.dart';
import 'package:meddis/utils/color.dart';
import 'package:meddis/utils/custom_text_style.dart';
import 'package:provider/provider.dart';

class MainDrugView extends StatelessWidget {
  MainDrugView({super.key});

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          surfaceTintColor: MyColor.primary,
          titleSpacing: 0,
          leadingWidth: 40,
          centerTitle: false,
          backgroundColor: MyColor.backgroundColor,
          title: Row(
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.keyboard_arrow_left_sharp)),
              const Text(
                "Home",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Text(
              "Database Obat",
              style: CustomTextStyle.headerDrugStyle,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomSearchBar(
              hintText: "Paracetamol",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer<DrugMenuProvider>(
            builder: (context, data, _) {
              return Column(
                children: [
                  CarouselSlider(
                    items: List.generate(
                      imgList.length,
                      (index) => ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        child: Image.network(
                          imgList[index],
                          fit: BoxFit.cover,
                          width: size.width - 32,
                        ),
                      ),
                    ),
                    options: CarouselOptions(
                      height: 180,
                      viewportFraction: 1.0,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        data.selectDestination(index);
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      imgList.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 3,
                        ),
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: data.index == index
                                ? Colors.black
                                : const Color(0xffD9D9D9)),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          // Text Menu
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("Kategori Obat", style: CustomTextStyle.headerStyle),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
                crossAxisCount: 2,
                childAspectRatio: 2,
                children: [
                  DrugCategoryCard(
                    title: "Obat Bebas",
                    assetImage:
                        "assets/images/drug_categories/free_medicine.png",
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const DrugListView(),
                        ),
                      );
                    },
                  ),
                  DrugCategoryCard(
                    title: "O. Bebas Terbatas",
                    assetImage:
                        "assets/images/drug_categories/limited_free_medicine.png",
                    onTap: () {},
                  ),
                  DrugCategoryCard(
                    title: "Obat Keras",
                    assetImage:
                        "assets/images/drug_categories/hard_medicine.png",
                    onTap: () {},
                  ),
                  DrugCategoryCard(
                    title: "Narkotika",
                    assetImage: "assets/images/drug_categories/narkotika.png",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
