import 'package:flutter/material.dart';
import 'package:todoapp/core/data/user_data.dart';
import 'package:todoapp/features/home/widgets/folder_card.dart';

class BodyContainer extends StatelessWidget {
  const BodyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: ValueListenableBuilder(
        valueListenable: foldersNotifier,
        builder: (context, folders, child) {
          return ValueListenableBuilder(
            valueListenable: isDarkModeNotifier,
            builder: (context, value, child) {
              return Column(
                children: folders
                    .asMap()
                    .entries
                    .map(
                      (entry) => TaskFoldercard(
                        folder: entry.value,
                        index: entry.key,
                      ),
                    )
                    .toList(),
              );
            },
          );
        },
      ),
    );
  }
}
