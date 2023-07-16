import 'package:flutter/material.dart';
import 'package:meddis/utils/color.dart';
import 'package:meddis/utils/custom_text_style.dart';
import 'package:meddis/views/components/custom_search_bar.dart';
import 'package:meddis/views/notes/components/list_notes.dart';
import 'package:meddis/views/notes/components/note_view.dart';

class MainNoteView extends StatelessWidget {
  const MainNoteView({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Notes",
                style: CustomTextStyle.headerDrugStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Expanded(
                    child: CustomSearchBar(
                      hintText: "Cari Notes",
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.fromLTRB(8, 4, 4, 4),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Colors.white,
                    surfaceTintColor: Colors.transparent,
                    elevation: 4,
                    child: InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.list,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const ListNotes(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColor.primary,
        onPressed: () {
          final DateTime time = DateTime.now();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NoteView(
              timeNow: time,
            ),
          ));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
