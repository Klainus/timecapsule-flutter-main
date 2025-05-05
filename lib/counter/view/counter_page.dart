import 'package:app_l10n/app_l10n.dart';
import 'package:as_boilerplate_flutter/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  @visibleForTesting
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.counterAppBarTitle),
      ),
      body: const Center(
        child: _Text(),
      ),
      floatingActionButton: const _Fabs(),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(BuildContext context) {
    final count = context.select(
      (CounterBloc bloc) => bloc.state.count,
    );

    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$count',
          style: theme.textTheme.displayLarge,
        ),
      ],
    );
  }
}

class _Fabs extends StatelessWidget {
  const _Fabs();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: 'increment',
          onPressed: () {
            context.read<CounterBloc>().add(
                  const CounterIncrementPressed(),
                );
          },
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          heroTag: 'decrement',
          onPressed: () {
            context.read<CounterBloc>().add(
                  const CounterDecrementPressed(),
                );
          },
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
