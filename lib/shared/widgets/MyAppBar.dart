import 'package:flutter/material.dart';

import '../../constants/app_constant.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final bool? isBackButtonEnabled;
  final bool? showNotification;
  final String? backButtonNavigationTo;
  const MyAppBar({
    this.title,
    this.isBackButtonEnabled = true,
    this.backButtonNavigationTo = "",
    this.showNotification = false,
  });

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(65);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppConstant.primaryColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: 65,
      centerTitle: true,
      title: Row(
        children: [
          if (widget.isBackButtonEnabled == true)
            Row(
              children: [
                InkWell(
                  onTap: () {
                    if (widget.backButtonNavigationTo == "") {
                      Navigator.pop(context);
                    } else {
                      Navigator.pushNamedAndRemoveUntil(context, widget.backButtonNavigationTo!, (route) => false, arguments: 0);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                ),
                SizedBox(width: 8),
              ],
            ),
          Expanded(
            child: Text(
              widget.title != null ? widget.title.toString() : "Tyger Booster",
              style: TextStyle(
                fontSize: 20,
                color: AppConstant.whiteColor,
                fontWeight: FontWeight.w300,
                letterSpacing: 2,
              ),
            ),
          ),
        ],
      ),
      actions: [
        if (widget.showNotification == true)
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: AppConstant.secondaryColor,
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(color: AppConstant.ontapRoundCounr, width: 0.7),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.notifications_outlined,
                      color: AppConstant.ontapRoundCounr,
                    ),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
