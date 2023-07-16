import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meddis/views/notes/components/note_view.dart';

class ListNotes extends StatelessWidget {
  const ListNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(10, (index) {
        return CupertinoContextMenu(
          previewBuilder: (context, animation, child) {
            return SingleChildScrollView(
              child: Card(
                color: Colors.white,
                surfaceTintColor: Colors.transparent,
                clipBehavior: Clip.antiAlias,
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
                        "Dummy Header",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      height: 0,
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
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
          child: SingleChildScrollView(
            child: Card(
              margin: const EdgeInsets.fromLTRB(0, 6, 0, 6),
              color: Colors.white,
              surfaceTintColor: Colors.transparent,
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
                      "Dummy Header",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras id vestibulum eros. Maecenas sed lorem a odio suscipit ullamcorper non in massa. Vivamus vitae quam nibh. Suspendisse vehicula, diam a porta semper, leo metus ornare elit, ut facilisis erat dolor ac nibh. Integer sollicitudin neque sed nibh rhoncus, sed consequat magna pharetra. Cras ipsum sapien, auctor nec massa dapibus, consequat commodo risus. Pellentesque feugiat dictum tellus, sit amet gravida nisi ultricies a. Curabitur ut mauris posuere, tristique leo sit amet, fermentum lectus. Nam malesuada, nulla a condimentum lobortis, turpis nibh efficitur lectus, id imperdiet mi eros eget sem. Quisque eget sollicitudin nunc, commodo efficitur neque. In viverra rutrum tincidunt. Vestibulum eu velit eu quam elementum lacinia nec semper felis. Praesent ac rhoncus lectus, a pharetra eros. Donec tristique leo tortor, vel venenatis nisi dapibus non. Nam velit est, malesuada in tincidunt vel, tempor non risus.Ut in pharetra felis. Aenean aliquet at arcu et viverra. Aenean tempus neque id enim ornare, vitae faucibus quam tempor. Integer euismod eget mauris sit amet laoreet. Pellentesque at diam suscipit, interdum elit ac, pellentesque augue. Vivamus tellus nunc, venenatis vitae accumsan vitae, rhoncus a dui. Duis ac massa porttitor, viverra justo id, condimentum justo. Vivamus ante neque, eleifend at tempus at, vulputate in massa. Maecenas sapien diam, maximus eu pulvinar vel, tempor mollis massa. Nullam id porta nunc, vel hendrerit mi. Maecenas nec dui sed dolor ornare pulvinar.",
                      maxLines: 3,
                      style: TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Senin, 12 Juli 2023',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
