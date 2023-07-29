// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meddis/views/notes/components/note_view.dart';

class GridNotes extends StatelessWidget {
  const GridNotes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.only(top: 2),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      children: List.generate(4, (index) {
        final odd = index % 2 == 1;
        return CupertinoContextMenu(
          previewBuilder: (context, animation, child) {
            print('index sekarang : $index');
            return SingleChildScrollView(
              child: Card(
                color: Colors.white,
                surfaceTintColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "s",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.black.withOpacity(0.2),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: OpenContainer(
                        openElevation: 0,
                        closedElevation: 0,
                        openColor: Colors.transparent,
                        closedColor: Colors.white,
                        middleColor: Colors.white,
                        transitionDuration: const Duration(milliseconds: 700),
                        closedBuilder: (context, action) => const SizedBox(
                          width: double.maxFinite,
                          child: Text(
                            "asdasd",
                            maxLines: 8,
                            textAlign: TextAlign.left,
                            style: TextStyle(overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        openBuilder: (context, action) {
                          return const NoteView();
                        },
                        onClosed: (data) {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          actions: [
            const CupertinoContextMenuAction(
              trailingIcon: CupertinoIcons.cloud_upload,
              child: Text('Update'),
            ),
            CupertinoContextMenuAction(
              isDestructiveAction: true,
              trailingIcon: CupertinoIcons.delete,
              child: const Text('Delete'),
              onPressed: () {},
            ),
          ],
          child: Card(
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(odd ? 4 : 0, 4, odd ? 0 : 4, 4),
            surfaceTintColor: Colors.transparent,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "folderViewModel.notesModelsById[index].fileName!,",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "folderViewModel.notesModelsById[index].notes ?? ''",
                    maxLines: 3,
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text('sd'),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
