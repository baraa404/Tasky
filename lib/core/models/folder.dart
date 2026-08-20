import 'package:todoapp/core/models/task.dart';

class Folder {
  final String name;
  final String description;
  final String tag;
  final List<Task> tasks;

  Folder({
    required this.name,
    required this.description,
    required this.tag,
    required this.tasks,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'tag': tag,
        'tasks': tasks.map((t) => t.toJson()).toList(),
      };

  factory Folder.fromJson(Map<String, dynamic> json) => Folder(
        name: json['name'] as String,
        description: json['description'] as String,
        tag: json['tag'] as String? ?? '',
        tasks: (json['tasks'] as List<dynamic>? ?? [])
            .map((t) => Task.fromJson(t as Map<String, dynamic>))
            .toList(),
      );

  Folder copyWith({
    String? name,
    String? description,
    String? tag,
    List<Task>? tasks,
  }) {
    return Folder(
      name: name ?? this.name,
      description: description ?? this.description,
      tag: tag ?? this.tag,
      tasks: tasks ?? this.tasks,
    );
  }
}
