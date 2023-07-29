import 'package:azlistview/azlistview.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:meddis/utils/color.dart';
import 'package:meddis/utils/custom_text_style.dart';

import 'drug_view.dart';

class DrugList extends ISuspensionBean {
  final String title;
  final String tag;
  DrugList({required this.title, required this.tag});

  @override
  String getSuspensionTag() => tag;
}

class DrugListView extends StatefulWidget {
  const DrugListView({super.key});

  @override
  State<DrugListView> createState() => _DrugListViewState();
}

class _DrugListViewState extends State<DrugListView> {
  var faker = Faker();
  List<DrugList> items = [];
  List<String> newData = [];

  @override
  void initState() {
    super.initState();
    newData = generateFakeDataList(100);
    initList(newData);
  }

  void initList(List<String> items) {
    this.items =
        items.map((item) => DrugList(title: item, tag: item[0])).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.white,
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
                "Database Obat",
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
            padding: const EdgeInsets.all(22),
            child: Text(
              "List Obat Bebas",
              style: CustomTextStyle.headerDrugStyle,
            ),
          ),
          Expanded(
            child: AzListView(
              indexBarOptions: const IndexBarOptions(
                indexHintAlignment: Alignment.centerRight,
              ),
              data: items,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return _buildListItem(item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(DrugList item) => Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DrugView(
                  name: item.title,
                ),
              ),
            ),
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 8),
                      child: Text(item.title),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Divider(
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  List<String> generateFakeDataList(int count) {
    Faker faker = Faker();
    List<String> dataList = [];
    int startIndex = 65; // ASCII value for 'A'

    for (var i = 0; i < count; i++) {
      // String fakeData = faker.person.name();
      String fakeName =
          '${String.fromCharCode(startIndex + i)} ${faker.person.firstName()}';
      dataList.add(fakeName);
    }

    return dataList;
  }
}
