import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todoapp/core/data/user_data.dart';
import 'package:todoapp/shared/widgets/avatar_selector_widget.dart';
import 'package:todoapp/shared/widgets/theme_toggle_widget.dart';
import 'package:todoapp/shared/widgets/color_picker_widget.dart';
import 'package:todoapp/features/onboarding/screens/welcome_screen1.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});
  final editnamekey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          ValueListenableBuilder(
                            valueListenable: selectedAvatar,
                            builder: (context, avatar, child) {
                              return GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                      child: Container(
                                        width: 300,
                                        height: 400,
                                        padding: EdgeInsets.all(16),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Select Avatar',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            Expanded(
                                              child: AvatarSelectorWidget(
                                                background: false,
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text('Close'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.transparent,
                                  child: ClipOval(
                                    child: SvgPicture.asset(
                                      avatar,
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ValueListenableBuilder(
                                  valueListenable: userName,
                                  builder: (context, name, child) {
                                    return Text(
                                      name.isEmpty ? 'User' : name,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  },
                                ),
                                Text(
                                  'Tap to edit profile',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              final nameController = TextEditingController(
                                text: userName.value,
                              );
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Edit Name'),
                                  content: Form(
                                    key: editnamekey,
                                    child: TextFormField(
                                      controller: nameController,
                                      autofocus: true,
                                      decoration: InputDecoration(
                                        hintText: 'Enter your name',
                                      ),
                                      autovalidateMode: AutovalidateMode.always,
                                      validator: (value) {
                                        if (value != null &&
                                            value.length > 10) {
                                          return 'Name must less than 10 characters';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        if (editnamekey.currentState!
                                            .validate()) {
                                          userName.value = nameController.text;
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Text('Save'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            icon: Icon(Icons.edit, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.palette, size: 24),
                              SizedBox(width: 12),
                              Text(
                                'Theme Color',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          ValueListenableBuilder(
                            valueListenable: selectedColor,
                            builder: (context, value, child) {
                              return ColorPickerWidget();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 10),
                                  Icon(Icons.dark_mode, size: 24),
                                  SizedBox(width: 10),
                                  Text(
                                    'Mode',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                ],
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: ThemeToggleWidget(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 10),
                                  Icon(Icons.dark_mode, size: 24),
                                  SizedBox(width: 10),
                                  Text(
                                    'Start',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                ],
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: FilledButton(
                                  onPressed: () async {
                                    await appState.resetOnboarding();
                                    if (!context.mounted) return;
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      PageTransition(
                                        alignment: Alignment.center,
                                        type: PageTransitionType.scale,
                                        child: WelcomeScreen1(),
                                        duration: Duration(milliseconds: 500),
                                      ),
                                      (route) => false,
                                    );
                                  },
                                  style: FilledButton.styleFrom(
                                    minimumSize: Size(90, 45),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  child: Text('Over'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).iconTheme.color,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
