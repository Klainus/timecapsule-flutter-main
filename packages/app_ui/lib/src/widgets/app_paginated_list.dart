import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';

class AppPaginatedList<T> extends StatefulWidget {
  const AppPaginatedList({
    required this.hasReachedMax,
    required this.isLoading,
    required this.itemSpace,
    required this.items,
    required this.onBottomReached,
    required this.header,
    required this.builder,
    this.controller,
    super.key,
  });

  final bool hasReachedMax;
  final bool isLoading;
  final double itemSpace;
  final List<T> items;
  final void Function() onBottomReached;
  final Widget header;
  final Widget? Function(T) builder;
  final ScrollController? controller;

  @override
  State<AppPaginatedList<T>> createState() => AppPaginatedListState();
}

class AppPaginatedListState<T> extends State<AppPaginatedList<T>> {
  late final _controller = widget.controller ?? ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    if (widget.controller == null) _controller.dispose();

    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      widget.onBottomReached();
    }
  }

  bool get _isBottom {
    if (!_controller.hasClients) return false;
    final hasReachedMax = widget.hasReachedMax;
    final isLoading = widget.isLoading;
    if (isLoading || hasReachedMax) return false;
    final maxScroll = _controller.position.maxScrollExtent;
    final currentScroll = _controller.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return ListView.separated(
      controller: _controller,
      padding: EdgeInsets.only(
        left: spacing.horizontalValueTimes(1.5),
        right: spacing.horizontalValueTimes(1.5),
        bottom: spacing.tripleVerticalValue,
      ),
      separatorBuilder: (_, index) {
        if (index == 0) return const SizedBox.shrink();
        return SizedBox(height: widget.itemSpace);
      },
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            children: [
              widget.header,
              if (!widget.isLoading && widget.items.isEmpty)
                const PaginatedListNoResults._(),
            ],
          );
        }

        final items = widget.items;
        final length = items.length;

        index -= 1;
        if (index >= length) return const Spinner();

        final item = items[index];
        return widget.builder(item);
      },
      itemCount: widget.hasReachedMax
          ? widget.items.length + 1
          : widget.items.length + 2,
    );
  }
}

@visibleForTesting
class PaginatedListNoResults extends StatelessWidget {
  const PaginatedListNoResults._();

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final l10n = context.l10n;

    return Center(
      child: Text(
        l10n.noResults,
        style: textTheme.bodyMedium,
      ),
    );
  }
}
