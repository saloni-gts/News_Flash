import 'package:flutter/material.dart';

class CustomCurvedAppbar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  bool isTitleCenter;

  final bool showBackIcon;

  // bool is
  CustomCurvedAppbar({super.key, this.title = "", this.isTitleCenter = false, this.showBackIcon = true});

  @override
  Widget build(BuildContext context) {
    print("appbar text===>>>$title");

    return AppBar(
      centerTitle: isTitleCenter,
      titleSpacing: 0.0,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(255, 93, 138, 221),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(22.0),
      )),
      leading: showBackIcon
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ))
          : const SizedBox(),
      title: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * .6,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(12.0), bottomLeft: Radius.circular(12.0)),
          color: Color.fromARGB(255, 93, 138, 221),
        ),
        child: Row(mainAxisAlignment: isTitleCenter ? MainAxisAlignment.center : MainAxisAlignment.start, children: [
          // 8.ww,
          Padding(
            padding: const EdgeInsets.only(right: 0.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold
                  // fontFamily: AppFonts.bold,
                  ),
            ),
          ),

          // 18.ww
        ]),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(62);
}
