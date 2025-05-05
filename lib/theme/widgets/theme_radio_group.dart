import 'package:as_boilerplate_flutter/theme/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeRadioGroup extends StatelessWidget {
  const ThemeRadioGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.select(
      (ThemeBloc bloc) => bloc.state,
    );

    return Column(
      children: [
        for (final value in ThemeMode.values)
          RadioListTile(
            title: Text(value.name),
            value: value,
            groupValue: theme,
            onChanged: (ThemeMode? value) {
              if (value != null) {
                context.read<ThemeBloc>().add(
                      ThemeOptionPressed(value),
                    );
              }
            },
          ),
      ],
    );
  }
}
