import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/core/constants/app_assets.dart';
import 'package:todoapp/core/constants/app_colors.dart';
import 'package:todoapp/core/models/folder.dart';

class LocalStorage {
  static const _keyUserName = 'user_name';
  static const _keyAvatar = 'selected_avatar';
  static const _keyDarkMode = 'is_dark_mode';
  static const _keyThemeColor = 'theme_color';
  static const _keyOnboardingDone = 'onboarding_done';
  static const _keyFolders = 'folders';

  final SharedPreferences _prefs;

  LocalStorage(this._prefs);

  static Future<LocalStorage> init() async {
    final prefs = await SharedPreferences.getInstance();
    return LocalStorage(prefs);
  }

  // --- User preferences ---

  String get userName => _prefs.getString(_keyUserName) ?? '';

  Future<void> setUserName(String value) =>
      _prefs.setString(_keyUserName, value);

  String get selectedAvatar =>
      _prefs.getString(_keyAvatar) ?? AppAssets.avatars[0];

  Future<void> setSelectedAvatar(String value) =>
      _prefs.setString(_keyAvatar, value);

  bool get isDarkMode => _prefs.getBool(_keyDarkMode) ?? false;

  Future<void> setDarkMode(bool value) => _prefs.setBool(_keyDarkMode, value);

  Color get themeColor {
    final stored = _prefs.getInt(_keyThemeColor);
    if (stored == null) return AppColors.defaultThemeColor;
    return Color(stored);
  }

  Future<void> setThemeColor(Color value) =>
      _prefs.setInt(_keyThemeColor, value.toARGB32());

  bool get onboardingDone => _prefs.getBool(_keyOnboardingDone) ?? false;

  Future<void> setOnboardingDone(bool value) =>
      _prefs.setBool(_keyOnboardingDone, value);

  // --- Folders / tasks ---

  List<Folder> getFolders() {
    final raw = _prefs.getString(_keyFolders);
    if (raw == null || raw.isEmpty) return [];
    final list = jsonDecode(raw) as List<dynamic>;
    return list
        .map((e) => Folder.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> saveFolders(List<Folder> folders) async {
    final encoded = jsonEncode(folders.map((f) => f.toJson()).toList());
    await _prefs.setString(_keyFolders, encoded);
  }

  Future<void> clearUserData() async {
    await _prefs.remove(_keyUserName);
    await _prefs.remove(_keyAvatar);
    await _prefs.remove(_keyDarkMode);
    await _prefs.remove(_keyThemeColor);
    await _prefs.remove(_keyOnboardingDone);
    await _prefs.remove(_keyFolders);
  }
}
