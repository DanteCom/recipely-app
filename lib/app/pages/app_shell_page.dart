import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipely_app/shared/resources/resources.dart';
import 'package:recipely_app/shared/widgets/app_svg_picture.dart';

class AppShellPage extends StatefulWidget {
  final StatefulNavigationShell _navigationShell;
  const AppShellPage(this._navigationShell, {super.key});

  @override
  State<AppShellPage> createState() => _AppShellPageState();
}

class _AppShellPageState extends State<AppShellPage> {
  bool isActive(int index) => currentIndex == index;
  void goBranch(int index) => widget._navigationShell.goBranch(index);

  int get currentIndex => widget._navigationShell.currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: widget._navigationShell,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF042628),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const AppSvgPicture(Svgs.chef),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 40,
              offset: Offset(0, -10),
              color: Color(0xFF95A8C3),
            ),
          ],
        ),
        child: ClipPath(
          clipper: BNBClipper(),
          child: Container(
            color: Colors.white,
            child: SafeArea(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: BottomNavItem(
                      isActive: isActive(0),
                      onPressed: isActive(0) ? null : () => goBranch(0),
                      activeIcon: Svgs.homeActive,
                      inactiveIcon: Svgs.homeInactive,
                    ),
                  ),
                  Expanded(
                    child: BottomNavItem(
                      isActive: isActive(1),
                      onPressed: isActive(1) ? null : () => goBranch(1),
                      activeIcon: Svgs.searchActive,
                      inactiveIcon: Svgs.searchInactive,
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: BottomNavItem(
                      isActive: isActive(2),
                      onPressed: isActive(2) ? null : () => goBranch(2),
                      activeIcon: Svgs.bellActive,
                      inactiveIcon: Svgs.bellInactive,
                    ),
                  ),
                  Expanded(
                    child: BottomNavItem(
                      isActive: isActive(3),
                      onPressed: isActive(3) ? null : () => goBranch(3),
                      activeIcon: Svgs.profileActive,
                      inactiveIcon: Svgs.profileInactive,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String activeIcon;
  final String inactiveIcon;
  final bool isActive;
  final VoidCallback? onPressed;

  const BottomNavItem({
    super.key,
    required this.onPressed,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: AppSvgPicture(isActive ? activeIcon : inactiveIcon),
    );
  }
}

class BNBClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    const borderRadius = 25.0;

    const fabRadius = 40.0;
    const notchRadius = fabRadius + 10;

    path.moveTo(0, borderRadius);
    path.quadraticBezierTo(0, 0, borderRadius, 0);

    path.lineTo((size.width / 2 - notchRadius) - borderRadius, 0);

    path.quadraticBezierTo(
      size.width / 2 - notchRadius,
      0,
      size.width / 2 - notchRadius + 10,
      borderRadius / 2,
    );

    path.quadraticBezierTo(
      size.width / 2,
      notchRadius * 1.2,
      (size.width / 2 + notchRadius) - 10,
      borderRadius / 2,
    );

    path.quadraticBezierTo(
      size.width / 2 + notchRadius,
      0,
      (size.width / 2 + notchRadius) + borderRadius,
      0,
    );

    path.lineTo(size.width - borderRadius, 0);

    path.quadraticBezierTo(size.width, 0, size.width, borderRadius);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
