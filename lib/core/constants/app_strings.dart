// This file contains all static string constants used throughout the app
// Include app names, labels, error messages, validation messages, etc.
// Organize strings by feature or screen for better maintainability

class AppStrings {
  // App information
  static const String appName = 'Tasky';
  static const String appVersion = '1.0.0';

  // Welcome/Onboarding strings
  static const String welcomeTitle = 'Welcome to Tasky';
  static const String welcomeSubtitle = 'Organize your tasks efficiently';
  static const String getStarted = 'Get Started';
  static const String next = 'Next';
  static const String skip = 'Skip';

  // User setup strings
  static const String chooseAvatar = 'Choose Your Avatar';
  static const String enterName = 'Enter Your Name';
  static const String selectTheme = 'Select Theme';
  static const String darkMode = 'Dark Mode';
  static const String lightMode = 'Light Mode';

  // General UI strings
  static const String save = 'Save';
  static const String cancel = 'Cancel';
  static const String delete = 'Delete';
  static const String edit = 'Edit';
  static const String done = 'Done';

  // Error messages
  static const String errorGeneral = 'Something went wrong';
  static const String errorNameRequired = 'Name is required';
  static const String errorInvalidInput = 'Invalid input';

  // Validation messages
  static const String nameMinLength = 'Name must be at least 2 characters';
  static const String nameMaxLength = 'Name cannot exceed 50 characters';
}
