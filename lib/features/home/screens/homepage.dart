import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/tabler.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todoapp/core/data/user_data.dart';
import 'package:todoapp/features/home/widgets/body_container.dart';
import 'package:todoapp/features/home/widgets/fab_widget.dart';
import 'package:todoapp/features/home/widgets/folder_dialog.dart';
import 'package:todoapp/features/home/widgets/header_widget.dart';
import 'package:todoapp/features/settings/screens/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, value, child) {
        return ValueListenableBuilder(
          valueListenable: selectedColor,
          builder: (context, value, child) {
            return DraggableHome(
              title: Text(''),
              alwaysShowTitle: false,
              headerWidget: HeaderWidget(),
              expandedBody: SpinningCatWidget(),
              actions: [AvatarIconWidget()],
              backgroundColor: isDarkModeNotifier.value
                  ? Color.fromARGB(255, 32, 32, 32)
                  : const Color(0xFFF3E5DF),
              scrollController: _scrollController,
              headerExpandedHeight: 0.45,
              alwaysShowLeadingAndAction: true,
              curvedBodyRadius: 20,
              stretchMaxHeight: 0.5,
              centerTitle: false,
              fullyStretchable: true,
              appBarColor: selectedColor.value,
              leading: IconButton(
                color: Colors.white70,
                padding: EdgeInsets.only(left: 14),
                icon: ValueListenableBuilder(
                  valueListenable: isDarkModeNotifier,
                  builder: (context, value, child) {
                    return Iconify(Tabler.stars, size: 30, color: Colors.white);
                  },
                ),
                onPressed: () {},
              ),
              body: [BodyContainer()],
              floatingActionButton: FabButtonWidget(
                icon: Icons.create_new_folder,
                label: 'Add folder',
                scrollController: _scrollController,
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                          left: 20,
                          right: 20,
                          top: 20,
                        ),
                        child: FolderDialog(),
                      );
                    },
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}

class SpinningCatWidget extends StatelessWidget {
  const SpinningCatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedColor,
      builder: (context, value, child) {
        return Container(
          color: value,
          alignment: Alignment.center,
          child: Center(
            child: Lottie.asset(
              width: 200,
              height: 200,
              'assets/lotties/rainbowcat.json',
            ),
          ),
        );
      },
    );
  }
}

class AvatarIconWidget extends StatelessWidget {
  const AvatarIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: SettingsPage(),
            duration: Duration(milliseconds: 500),
          ),
        );
      },
      child: ValueListenableBuilder(
        valueListenable: selectedAvatar,
        builder: (context, avatar, child) {
          return Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              padding: EdgeInsets.all(4),
              child: CircleAvatar(
                radius: 19,
                backgroundColor: Colors.transparent,
                child: SvgPicture.asset(avatar, width: 36, height: 36),
              ),
            ),
          );
        },
      ),
    );
  }
}
