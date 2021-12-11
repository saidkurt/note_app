import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/note_controller.dart';

class SelectColor extends StatelessWidget {
  SelectColor({Key? key}) : super(key: key);
  List<Color> containerColor = [Colors.red, Colors.yellow, Colors.green];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: containerColor.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Obx(
        () => GestureDetector(
          onTap: () {
            Get.find<NoteController>().selectedcolor.value =
                containerColor[index].value;
          },
          child: Container(
            width: Get.find<NoteController>().selectedcolor.value ==
                    containerColor[index].value
                ? 40
                : 30,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: containerColor[index]),
          ),
        ),
      ),
    );
  }
}
