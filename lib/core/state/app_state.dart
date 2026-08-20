import 'package:flutter/material.dart';
import 'package:todoapp/core/constants/app_assets.dart';
import 'package:todoapp/core/constants/app_colors.dart';
import 'package:todoapp/core/models/folder.dart';
import 'package:todoapp/core/models/task.dart';
import 'package:todoapp/core/storage/local_storage.dart';

/// Central app state. UI keeps using ValueNotifiers — this layer
/// loads/saves them via [LocalStorage].
class AppState {
  AppState._(this._storage);

  final LocalStorage _storage;

  late final ValueNotifier<String> selectedAvatar;
  late final ValueNotifier<bool> isDarkModeNotifier;
  late final ValueNotifier<Color?> selectedColor;
  late final ValueNotifier<String> userName;
  late final ValueNotifier<bool> onboardingDone;
  late final ValueNotifier<List<Folder>> folders;

  static Future<AppState> create() async {
    final storage = await LocalStorage.init();
    final state = AppState._(storage);
    state._load();
    state._attachListeners();
    return state;
  }

  void _load() {
    selectedAvatar = ValueNotifier(_storage.selectedAvatar);
    isDarkModeNotifier = ValueNotifier(_storage.isDarkMode);
    selectedColor = ValueNotifier(_storage.themeColor);
    userName = ValueNotifier(_storage.userName);
    onboardingDone = ValueNotifier(_storage.onboardingDone);
    folders = ValueNotifier(_storage.getFolders());
  }

  void _attachListeners() {
    selectedAvatar.addListener(() {
      _storage.setSelectedAvatar(selectedAvatar.value);
    });
    isDarkModeNotifier.addListener(() {
      _storage.setDarkMode(isDarkModeNotifier.value);
    });
    selectedColor.addListener(() {
      final color = selectedColor.value;
      if (color != null) _storage.setThemeColor(color);
    });
    userName.addListener(() {
      _storage.setUserName(userName.value);
    });
    onboardingDone.addListener(() {
      _storage.setOnboardingDone(onboardingDone.value);
    });
    folders.addListener(() {
      _storage.saveFolders(folders.value);
    });
  }

  void addFolder(String name, String description, String tag) {
    folders.value = [
      ...folders.value,
      Folder(name: name, description: description, tag: tag, tasks: []),
    ];
  }

  void addTask(int folderIndex, String name, String description) {
    final list = List<Folder>.from(folders.value);
    final folder = list[folderIndex];
    list[folderIndex] = folder.copyWith(
      tasks: [
        ...folder.tasks,
        Task(name: name, description: description),
      ],
    );
    folders.value = list;
  }

  void deleteTask(int folderIndex, int taskIndex) {
    final list = List<Folder>.from(folders.value);
    final folder = list[folderIndex];
    final tasks = List<Task>.from(folder.tasks)..removeAt(taskIndex);
    list[folderIndex] = folder.copyWith(tasks: tasks);
    folders.value = list;
  }

  void toggleTask(int folderIndex, int taskIndex) {
    final list = List<Folder>.from(folders.value);
    final folder = list[folderIndex];
    final tasks = List<Task>.from(folder.tasks);
    final task = tasks[taskIndex];
    tasks[taskIndex] = task.copyWith(isCompleted: !task.isCompleted);
    list[folderIndex] = folder.copyWith(tasks: tasks);
    folders.value = list;
  }

  Future<void> resetOnboarding() async {
    await _storage.clearUserData();
    selectedAvatar.value = AppAssets.avatars[0];
    isDarkModeNotifier.value = false;
    selectedColor.value = AppColors.defaultThemeColor;
    userName.value = '';
    onboardingDone.value = false;
    folders.value = [];
  }
}

/// Global instance set in [main] before runApp.
late AppState appState;

/// Convenience aliases so existing UI imports stay simple.
ValueNotifier<String> get selectedAvatar => appState.selectedAvatar;
ValueNotifier<bool> get isDarkModeNotifier => appState.isDarkModeNotifier;
ValueNotifier<Color?> get selectedColor => appState.selectedColor;
ValueNotifier<String> get userName => appState.userName;
ValueNotifier<List<Folder>> get foldersNotifier => appState.folders;
