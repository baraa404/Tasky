import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todoapp/core/constants/app_assets.dart';
import 'package:todoapp/core/data/user_data.dart';

class AvatarSelectorWidget extends StatefulWidget {
  const AvatarSelectorWidget({super.key, required this.background});

  final bool background;
  @override
  State<AvatarSelectorWidget> createState() => _AvatarSelectorWidgetState();
}

class _AvatarSelectorWidgetState extends State<AvatarSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedColor,
      builder: (context, value, child) {
        return Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: widget.background
                ? selectedColor.value?.withAlpha(180)
                : Colors.transparent,
          ),
          child: ValueListenableBuilder(
            valueListenable: selectedAvatar,
            builder: (context, value, child) {
              return GridView.count(
                padding: EdgeInsets.all(8),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: AppAssets.avatars.map((avatar) {
                  bool isSelected = selectedAvatar.value == avatar;
                  return GestureDetector(
                    onTap: () {
                      selectedAvatar.value = avatar;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected ? Colors.white : Colors.transparent,
                          width: 4,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: SvgPicture.asset(avatar),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        );
      },
    );
  }
}
