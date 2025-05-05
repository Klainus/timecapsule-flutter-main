import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final parentRoute = ModalRoute.of(context);
    final hasAppBackButton = parentRoute?.impliesAppBarDismissal ?? false;

    final spacing = context.spacing;

    return AppBar(
      elevation: 0,
      titleSpacing: 0,
      toolbarHeight: preferredSize.height,
      centerTitle: false,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      title: Padding(
        padding: EdgeInsets.only(
          left: spacing.horizontalValueTimes(1.5),
        ),
        child: Row(
          children: [
            if (hasAppBackButton) const AppBackButton._(),
          ],
        ),
      ),
    );
  }
}

@visibleForTesting
class AppBackButton extends StatelessWidget {
  const AppBackButton._();

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final l10n = context.l10n;

    return InkWell(
      onTap: Navigator.of(context).maybePop,
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      child: Row(
        children: [
          const Icon(
            Icons.arrow_back_ios,
          ),
          Text(
            l10n.backButtonText,
            style: textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
