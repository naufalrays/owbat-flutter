// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:meddis/utils/color.dart';
import 'package:meddis/utils/custom_text_style.dart';
import 'package:meddis/views/drugs/components/custom_expansion_tile.dart';

class DrugView extends StatelessWidget {
  const DrugView({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).padding.top;
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
                "List Obat",
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
              Image.asset(
                "assets/images/paracetamol.png",
                width: 100,
                height: 100,
              ),
              Text(
                "Paracetamol",
                style: CustomTextStyle.headerDrugStyle,
              ),
              Text(
                "Acetaminophen · Obat Bebas",
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      margin: EdgeInsets.zero,
                      color: Colors.white,
                      surfaceTintColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Image.asset(
                                "assets/images/pil.png",
                                width: 20,
                                height: 20,
                              ),
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "2.5 mg",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text("per Hari"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Card(
                      margin: EdgeInsets.zero,
                      color: Colors.white,
                      surfaceTintColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Image.asset(
                                "assets/images/clock.png",
                                width: 26,
                                height: 26,
                              ),
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "2 x Pil",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text("per Hari"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Tentang Obat",
                style: CustomTextStyle.headerStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet mi risus. Curabitur ac est ultricies, pharetra orci nec, tincidunt odio. Praesent tellus lectus, aliquam quis dolor at, tempor lobortis ipsum. Donec fringilla sapien sit amet quam venenatis, in vestibulum elit dictum. Integer nec augue ac magna condimentum tempus. Pellentesque id facilisis lacus. Sed tempor nisi vitae diam tempor faucibus. \n\nCurabitur vel arcu id eros auctor dignissim. Curabitur venenatis nisi non turpis eleifend, quis auctor mauris commodo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nam vitae enim aliquet, molestie elit a, ultricies nisl. Curabitur efficitur, est auctor pharetra egestas, ligula odio convallis ante, ac tristique nisl urna at eros.",
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomExpansionTile(
                icon: Icon(
                  Icons.warning,
                  color: Colors.red,
                ),
                title: "Peringatan",
              ),
              const CustomExpansionTile(
                icon: Icon(
                  Icons.medication_rounded,
                  color: Colors.orange,
                ),
                title: "Dosis",
              ),
              const CustomExpansionTile(
                icon: Icon(
                  Icons.sick_sharp,
                  color: Colors.green,
                ),
                title: "Efek Samping",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
