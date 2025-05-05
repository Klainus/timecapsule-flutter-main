// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/helpers.dart';

void main() {
  final items = List<int>.generate(100, (i) => i);

  final header = Text('header');

  group('AppPaginatedList', () {
    Widget buildListItem(int index) => Text(
          key: ValueKey(index),
          'item',
        );

    testWidgets('renders list items', (tester) async {
      await tester.pumpApp(
        AppPaginatedList(
          hasReachedMax: false,
          isLoading: false,
          itemSpace: 16,
          items: items,
          onBottomReached: () {},
          header: header,
          builder: buildListItem,
        ),
      );

      expect(
        find.byType(Text),
        // The amount of list item widgets that fit in the test viewport
        findsNWidgets(18),
      );
    });

    testWidgets('renders first list item', (tester) async {
      await tester.pumpApp(
        AppPaginatedList(
          hasReachedMax: false,
          isLoading: false,
          itemSpace: 16,
          items: items,
          onBottomReached: () {},
          header: header,
          builder: buildListItem,
        ),
      );

      expect(
        find.byKey(ValueKey(items.first)),
        findsOneWidget,
      );
    });

    testWidgets('renders last list item when scrolled to the bottom',
        (tester) async {
      await tester.pumpApp(
        AppPaginatedList(
          hasReachedMax: false,
          isLoading: false,
          itemSpace: 16,
          items: items,
          onBottomReached: () {},
          header: header,
          builder: buildListItem,
        ),
      );

      await tester.drag(find.byType(ListView), const Offset(0, -3000));
      await tester.pump();

      expect(
        find.byKey(ValueKey(items.last)),
        findsOneWidget,
      );
    });

    group('header', () {
      testWidgets('is rendered when results are not empty', (tester) async {
        await tester.pumpApp(
          AppPaginatedList(
            hasReachedMax: false,
            isLoading: false,
            itemSpace: 16,
            items: [0],
            onBottomReached: () {},
            header: header,
            builder: buildListItem,
          ),
        );

        expect(find.byWidget(header), findsOneWidget);
      });

      testWidgets('is rendered when results are empty', (tester) async {
        await tester.pumpApp(
          AppPaginatedList<int>(
            hasReachedMax: false,
            isLoading: false,
            itemSpace: 16,
            items: [],
            onBottomReached: () {},
            header: header,
            builder: buildListItem,
          ),
        );

        expect(find.byWidget(header), findsOneWidget);
      });
    });

    group('PaginatedListNoResults', () {
      testWidgets(
          'is rendered when not fetching more '
          'and results are empty', (tester) async {
        await tester.pumpApp(
          AppPaginatedList<int>(
            hasReachedMax: false,
            isLoading: false,
            itemSpace: 16,
            items: [],
            onBottomReached: () {},
            header: header,
            builder: buildListItem,
          ),
        );

        expect(find.byType(PaginatedListNoResults), findsOneWidget);
      });

      testWidgets('is not rendered when results are not empty', (tester) async {
        await tester.pumpApp(
          AppPaginatedList(
            hasReachedMax: false,
            isLoading: false,
            itemSpace: 16,
            items: [0],
            onBottomReached: () {},
            header: header,
            builder: buildListItem,
          ),
        );

        expect(find.byType(PaginatedListNoResults), findsNothing);
      });
    });

    group('Spinner', () {
      testWidgets('is rendered when !hasReachedMax and list is empty',
          (tester) async {
        await tester.pumpApp(
          AppPaginatedList<int>(
            hasReachedMax: false,
            isLoading: true,
            itemSpace: 16,
            items: [],
            onBottomReached: () {},
            header: header,
            builder: buildListItem,
          ),
        );

        expect(find.byType(Spinner), findsOneWidget);
      });

      testWidgets(
          'is rendered when !hasReachedMax '
          'and scrolled to the bottom', (tester) async {
        await tester.pumpApp(
          AppPaginatedList(
            hasReachedMax: false,
            isLoading: true,
            itemSpace: 16,
            items: items,
            onBottomReached: () {},
            header: header,
            builder: buildListItem,
          ),
        );

        await tester.drag(find.byType(ListView), const Offset(0, -3000));
        await tester.pump();

        expect(find.byType(Spinner), findsOneWidget);
      });

      testWidgets(
          'is not rendered when hasReachedMax '
          'and scrolled to the bottom', (tester) async {
        await tester.pumpApp(
          AppPaginatedList<int>(
            hasReachedMax: true,
            isLoading: true,
            itemSpace: 16,
            items: items,
            onBottomReached: () {},
            header: header,
            builder: buildListItem,
          ),
        );

        await tester.drag(find.byType(ListView), const Offset(0, -3000));
        await tester.pump();

        expect(find.byType(Spinner), findsNothing);
      });

      testWidgets('is not rendered when hasReachedMax and list is empty',
          (tester) async {
        await tester.pumpApp(
          AppPaginatedList<int>(
            hasReachedMax: true,
            isLoading: false,
            itemSpace: 16,
            items: [],
            onBottomReached: () {},
            header: header,
            builder: buildListItem,
          ),
        );

        expect(find.byType(Spinner), findsNothing);
      });
    });

    group('onBottomReached', () {
      testWidgets(
          'is called when scrolled to the bottom '
          'and !hasReachedMax and !isLoading', (tester) async {
        var called = false;

        await tester.pumpApp(
          AppPaginatedList(
            hasReachedMax: false,
            isLoading: false,
            itemSpace: 16,
            items: items,
            onBottomReached: () {
              called = true;
            },
            header: header,
            builder: buildListItem,
          ),
        );

        await tester.drag(find.byType(ListView), const Offset(0, -3000));
        await tester.pump();

        expect(called, true);
      });

      testWidgets(
          'is not called when scrolled to the bottom '
          'and hasReachedMax', (tester) async {
        var called = false;

        await tester.pumpApp(
          AppPaginatedList(
            hasReachedMax: true,
            isLoading: false,
            itemSpace: 16,
            items: items,
            onBottomReached: () {
              called = true;
            },
            header: header,
            builder: buildListItem,
          ),
        );

        await tester.drag(find.byType(ListView), const Offset(0, -3000));
        await tester.pump();

        expect(called, false);
      });

      testWidgets(
          'is not called when scrolled to the bottom '
          'and isLoading', (tester) async {
        var called = false;

        await tester.pumpApp(
          AppPaginatedList(
            hasReachedMax: false,
            isLoading: true,
            itemSpace: 16,
            items: items,
            onBottomReached: () {
              called = true;
            },
            header: header,
            builder: buildListItem,
          ),
        );

        await tester.drag(find.byType(ListView), const Offset(0, -3000));
        await tester.pump();

        expect(called, false);
      });

      testWidgets('is not called when list is empty and scroll is attempted',
          (tester) async {
        var called = false;

        await tester.pumpApp(
          AppPaginatedList<int>(
            hasReachedMax: true,
            isLoading: false,
            itemSpace: 16,
            items: [],
            onBottomReached: () {
              called = true;
            },
            header: header,
            builder: buildListItem,
          ),
        );

        await tester.drag(find.byType(ListView), const Offset(0, -3000));
        await tester.pump();

        expect(called, false);
      });
    });
  });
}
