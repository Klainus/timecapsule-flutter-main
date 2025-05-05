import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:as_boilerplate_flutter/create_account/create_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PolicyLinks extends StatelessWidget {
  const PolicyLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final l10n = context.l10n;

    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      children: [
        Text(
          l10n.policyLinksInfoPart1,
          style: textTheme.bodyMedium,
        ),
        const TermsLink._(),
        Text(
          l10n.policyLinksInfoPart2,
          style: textTheme.bodyMedium,
        ),
        const DataHandlingLink._(),
      ],
    );
  }
}

@visibleForTesting
class TermsLink extends StatelessWidget {
  const TermsLink._();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return GestureDetector(
      onTap: () {
        context.read<CreateAccountBloc>().add(
              const CreateAccountTermsLinkPressed(),
            );
      },
      child: Text(
        l10n.policyLinksTerms,
        style: AppTextStyle.textButton,
      ),
    );
  }
}

@visibleForTesting
class DataHandlingLink extends StatelessWidget {
  const DataHandlingLink._();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return GestureDetector(
      onTap: () {
        context.read<CreateAccountBloc>().add(
              const CreateAccountDataHandlingLinkPressed(),
            );
      },
      child: Text(
        l10n.policyLinksDataHandling,
        style: AppTextStyle.textButton,
      ),
    );
  }
}
