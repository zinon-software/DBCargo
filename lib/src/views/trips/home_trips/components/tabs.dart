import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/searsh_controller.dart';
import '../../../widgets/catgeory_widget.dart';

class MyTabs extends StatefulWidget {
  const MyTabs({Key? key}) : super(key: key);

  @override
  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> {
  @override
  Widget build(BuildContext context) {
    final SearshController appState = Get.find();
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 30.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width - 82,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(19.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade600,
                  offset: const Offset(4, 4),
                  blurRadius: 15.0,
                  spreadRadius: 1,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 15.0,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Obx(
              () => Row(
                children: <Widget>[
                  for (final category in appState.categories)
                    Expanded(
                      flex: 1,
                      child: CategoryWidget(
                        category: category,
                        selectedCategory: appState.selectedCategory.value.categoryId,
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

