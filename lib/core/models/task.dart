class Task {
  final String name;
  final String description;
  bool isCompleted;

  Task({
    required this.name,
    required this.description,
    this.isCompleted = false,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'isCompleted': isCompleted,
      };

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        name: json['name'] as String,
        description: json['description'] as String,
        isCompleted: json['isCompleted'] as bool? ?? false,
      );

  Task copyWith({
    String? name,
    String? description,
    bool? isCompleted,
  }) {
    return Task(
      name: name ?? this.name,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
