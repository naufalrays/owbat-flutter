import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:meddis/utils/color.dart';

class NoteView extends StatelessWidget {
  const NoteView({
    Key? key,
    this.timeNow,
  }) : super(key: key);
  final DateTime? timeNow;

  @override
  Widget build(BuildContext context) {
    final DateTime time = DateTime.now();
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
                "Notes",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                maxLines: null,
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                onChanged: (value) {},
                autofocus: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  hintText: "Judul",
                  hintStyle:
                      TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                ),
              ),
              Row(
                children: [
                  Text(
                    timeNow != null
                        ? DateFormat.Hm().format(timeNow!).toString()
                        : "ASDasd",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  const Text(" · "),
                  Text(
                    DateFormat.yMMMd().format(time).toString(),
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  hintText: "Ketik sesuatu di sini",
                ),
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
