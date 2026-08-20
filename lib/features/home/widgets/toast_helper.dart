import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewFolderAlert extends StatelessWidget {
  final bool isTask;

  const NewFolderAlert({super.key, this.isTask = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 11.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.green,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isTask ? Icons.task : Icons.folder,
            color: Colors.white,
            size: 15,
          ),
          const SizedBox(width: 8.0),
          Text(
            isTask ? "Task added" : "Folder added",
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

late FToast fToast;

void showToast(BuildContext context, {required bool isTask}) {
  fToast = FToast();
  fToast.init(context);
  fToast.showToast(
    gravity: ToastGravity.TOP,
    child: NewFolderAlert(isTask: isTask),
    toastDuration: const Duration(seconds: 2),
    positionedToastBuilder:
        (BuildContext context, Widget child, ToastGravity? gravity) {
      return Positioned(
        top: MediaQuery.of(context).padding.top + 9.0,
        left: 0,
        right: 0,
        child: Material(
          color: Colors.transparent,
          child: Center(child: SizedBox(width: 500, child: child)),
        ),
      );
    },
  );
}
