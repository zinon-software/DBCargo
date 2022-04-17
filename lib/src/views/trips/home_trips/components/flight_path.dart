import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/trip_controller.dart';
import '../../../../models/category.dart';
import '../../../utilities/responsive.dart';
import '../../../widgets/text_widget.dart';

class FlightPath extends StatelessWidget {
  const FlightPath({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 500,
      width: isMobile(context)
          ? MediaQuery.of(context).size.width
          : 350,
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: GetBuilder<SearshController>(
        builder: (appState) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (Category category in appState.categories)
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: textWidget(
                    text: appState.selectedCategory.value
                                .categoryId ==
                            category.categoryId
                        ? category.name!.toUpperCase()
                        : category.name,
                    colors: (appState.selectedCategory.value
                                .categoryId ==
                            category.categoryId)
                        ? Colors.white
                        : Colors.white60,
                    size: (appState.selectedCategory.value
                                .categoryId ==
                            category.categoryId)
                        ? 20
                        : null),
                ),
                onTap: () {
                  final isSelected = appState
                          .selectedCategory.value.categoryId ==
                      category.categoryId;
                  if (!isSelected) {
                    appState.updateCategory(category);
                  }
                },
              )
          ],
        ),
      ),
    );
  }
}
