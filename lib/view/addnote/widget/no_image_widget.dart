import 'package:flutter/material.dart';
import 'package:note_app/core/theme/app_theme.dart';

class NoImageWidget extends StatelessWidget {
  const NoImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Icon(Icons.add_photo_alternate_outlined,
          color: Colors.grey, size: 50),
      const SizedBox(height: 5),
      Text(
        "Add Image",
        style: AppTheme.darkThemeCopy.textTheme.bodyText1
            ?.copyWith(fontSize: 20, color: Colors.grey),
      ),
    ]);
  }
}
