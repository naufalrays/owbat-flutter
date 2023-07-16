import 'package:azlistview/azlistview.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Text("Drug List View"),
      ),
      body: AzListView(
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
    );
  }

  Widget _buildListItem(DrugList item) => GestureDetector(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
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
