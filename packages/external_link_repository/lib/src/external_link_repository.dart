import 'package:external_link_repository/external_link_repository.dart';

const termsLink = 'https://appshack.se/';
const dataHandlingLink = 'https://appshack.se/';

class ExternalLinkRepository {
  const ExternalLinkRepository(
    this._externalLinkService,
    this._appSettingsService,
  );

  final ExternalLinkService _externalLinkService;
  final AppSettingsService _appSettingsService;

  Future<void> _launch(String link) => _externalLinkService.launch(link);

  Future<void> launchTermsLink() => _launch(termsLink);
  Future<void> launchDataHandlingLink() => _launch(dataHandlingLink);

  Future<void> openAppSettings() => _appSettingsService.open();
}
