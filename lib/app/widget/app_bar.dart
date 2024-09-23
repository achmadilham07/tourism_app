import 'package:flutter/material.dart';
import 'package:tourism_app/app/widget/logo_widget.dart';

const addAppBarHeight = 8;

class DestinationAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DestinationAppBar({
    super.key,
    this.actions,
  });

  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: LogoWidget(height: kToolbarHeight + addAppBarHeight),
      ),
      centerTitle: true,
      actions: actions,
    );
  }
}

class DestinationSliverAppBar extends StatelessWidget {
  const DestinationSliverAppBar({
    super.key,
    this.actions,
  });

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: LogoWidget(height: kToolbarHeight + addAppBarHeight),
      ),
      centerTitle: true,
      snap: true,
      floating: true,
      actions: actions,
    );
  }
}
