// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:todoapp/core/data/user_data.dart';
import 'package:todoapp/features/home/widgets/toast_helper.dart';

final namekey = GlobalKey<FormState>();
final deskey = GlobalKey<FormState>();

class FolderDialog extends StatefulWidget {
  const FolderDialog({super.key});

  @override
  _FolderDialogState createState() => _FolderDialogState();
}

class _FolderDialogState extends State<FolderDialog> {
  final TextEditingController _folderNameController = TextEditingController();
  final TextEditingController _folderDesController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();
  final GlobalKey<FormState> _tagKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _folderNameController.dispose();
    _folderDesController.dispose();
    _tagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Add New Folder',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Folder Name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Form(
                key: namekey,
                child: TextFormField(
                  controller: _folderNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter a Folder name';
                    }
                    if (value.length >= 17) {
                      return 'Folder name must be less than 18 characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.folder),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Folder Description',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Form(
                key: deskey,
                child: TextFormField(
                  controller: _folderDesController,
                  maxLines: 2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter a Description';
                    }
                    if (value.length >= 50) {
                      return 'Description must be less than 50 characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.description),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tag',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Form(
                key: _tagKey,
                child: TextFormField(
                  controller: _tagController,
                  validator: (value) {
                    if (value != null && value.length >= 10) {
                      return 'Tag must be less than 10 characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.tag),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          FolderButtons(
            folderNameController: _folderNameController,
            folderDesController: _folderDesController,
            tagController: _tagController,
            tagKey: _tagKey,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class FolderButtons extends StatelessWidget {
  final TextEditingController folderNameController;
  final TextEditingController folderDesController;
  final TextEditingController tagController;
  final GlobalKey<FormState> tagKey;

  const FolderButtons({
    super.key,
    required this.folderNameController,
    required this.folderDesController,
    required this.tagController,
    required this.tagKey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Cancel'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (namekey.currentState!.validate() &&
                  deskey.currentState!.validate() &&
                  (tagController.text.isEmpty ||
                      (tagController.text.isNotEmpty &&
                          tagKey.currentState!.validate()))) {
                appState.addFolder(
                  folderNameController.text,
                  folderDesController.text,
                  tagController.text,
                );
                Navigator.pop(context);
                showToast(context, isTask: false);
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Add Folder'),
          ),
        ),
      ],
    );
  }
}
