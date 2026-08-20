// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/core/data/user_data.dart';
import 'package:todoapp/core/models/folder.dart';
import 'package:todoapp/features/home/widgets/task_dialog.dart';
import 'package:todoapp/features/home/widgets/toast_helper.dart';

class TaskListPage extends StatefulWidget {
  final Folder folder;
  final int folderIndex;

  const TaskListPage({
    super.key,
    required this.folder,
    required this.folderIndex,
  });

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  void addTask(String name, String description) {
    appState.addTask(widget.folderIndex, name, description);
  }

  void _deleteTask(int index) {
    appState.deleteTask(widget.folderIndex, index);
  }

  void _toggleTaskCompletion(int index) {
    appState.toggleTask(widget.folderIndex, index);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: foldersNotifier,
      builder: (context, folders, child) {
        final folder = folders[widget.folderIndex];
        return Scaffold(
          appBar: AppBar(
            title: Text(folder.name),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      contentPadding: const EdgeInsets.all(16.0),
                      content: TaskDialog(
                        onAddTask: (name, description) {
                          addTask(name, description);
                          showToast(context, isTask: true);
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          body: ValueListenableBuilder(
            valueListenable: isDarkModeNotifier,
            builder: (context, isDarkMode, child) {
              return folder.tasks.isEmpty
                  ? const Center(child: Text('No tasks yet. Add a task!'))
                  : ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: folder.tasks.length,
                      itemBuilder: (context, index) {
                        final task = folder.tasks[index];
                        return Dismissible(
                          key: Key('${task.name}$index'),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20),
                            color: Colors.red,
                            child: const Icon(Icons.delete, color: Colors.white),
                          ),
                          onDismissed: (direction) => _deleteTask(index),
                          child: Card(
                            elevation: 2,
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              leading: Checkbox(
                                value: task.isCompleted,
                                onChanged: (value) =>
                                    _toggleTaskCompletion(index),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              title: Text(
                                task.name,
                                style: GoogleFonts.aDLaMDisplay(
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                    decoration: task.isCompleted
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  ),
                                ),
                              ),
                              subtitle: Text(
                                task.description,
                                style: TextStyle(
                                  color: isDarkMode
                                      ? Colors.white70
                                      : Colors.black54,
                                  decoration: task.isCompleted
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
            },
          ),
        );
      },
    );
  }
}
