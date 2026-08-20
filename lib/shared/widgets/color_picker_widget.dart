import 'package:flutter/material.dart';
import 'package:todoapp/core/constants/app_colors.dart';
import 'package:todoapp/core/data/user_data.dart';

class ColorPickerWidget extends StatefulWidget {
  final Color? selectedColor;
  final ValueChanged<Color>? onColorSelected;
  final double itemSize;
  final double spacing;
  final EdgeInsets padding;

  const ColorPickerWidget({
    super.key,
    this.selectedColor,
    this.onColorSelected,
    this.itemSize = 28.0,
    this.spacing = 10.0,
    this.padding = const EdgeInsets.all(16.0),
  });

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  // Use AppColors.availableThemeColors for color options
  List<Color> get _colors => AppColors.availableThemeColors;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Color?>(
      valueListenable: selectedColor,
      builder: (context, currentColor, child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Pick your favorite color',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 2),
                child: SafeArea(
                  top: false, // مهم: نطفي فقط الـ top padding
                  child: GridView.count(
                    padding: EdgeInsets.zero, // نلغي أي padding افتراضي
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    mainAxisSpacing: widget.spacing,
                    crossAxisSpacing: widget.spacing,
                    children: _colors.map((c) => _buildColorItem(c)).toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildColorItem(Color color) {
    if (color == Colors.transparent) {
      return SizedBox(width: widget.itemSize, height: widget.itemSize);
    }

    final bool isSelected = selectedColor.value == color;

    return GestureDetector(
      onTap: () {
        selectedColor.value = color;
        widget.onColorSelected?.call(color);
      },
      child: Container(
        width: widget.itemSize,
        height: widget.itemSize,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: isSelected
            ? const Icon(Icons.check, color: Colors.white, size: 20.0)
            : null,
      ),
    );
  }
}
