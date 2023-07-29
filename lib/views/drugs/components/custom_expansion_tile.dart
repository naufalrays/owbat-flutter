// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: icon,
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              // color: MyColor.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut orci odio, tempor et dui eget, convallis sollicitudin urna. Maecenas eu elit quis dui molestie rhoncus. Integer sed turpis vitae dui congue vestibulum vel eget justo. Suspendisse vitae risus eget tortor dictum pulvinar eget at risus. Nunc dignissim, lectus vel vulputate pharetra, libero leo sodales quam, ac bibendum quam mi quis est. Nullam tempor pretium scelerisque. \n\nSuspendisse a risus et elit interdum molestie. Nulla ut scelerisque ipsum. Mauris sit amet sagittis nunc, sed tincidunt nisl. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse imperdiet felis massa, feugiat egestas urna egestas imperdiet. Sed tincidunt odio lectus."),
            )
          ],
        ),
      ),
    );
  }
}
