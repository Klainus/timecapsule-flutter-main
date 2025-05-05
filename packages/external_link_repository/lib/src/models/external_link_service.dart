import 'package:equatable/equatable.dart';
import 'package:url_launcher/url_launcher.dart';

class ExternalLinkException with EquatableMixin implements Exception {
  const ExternalLinkException(this.error);

  final Object? error;

  @override
  List<Object?> get props => [error];
}

class ExternalLinkFailure with EquatableMixin implements Exception {
  const ExternalLinkFailure(this.url);

  final Object? url;

  @override
  List<Object?> get props => [url];
}

class ExternalLinkService {
  const ExternalLinkService();

  String _withHttps(String url) {
    final hasHttpPrefix = url.startsWith('http:') || url.startsWith('https:');

    if (hasHttpPrefix) return url;
    return 'https:$url';
  }

  Future<void> launch(String urlString) async {
    Uri url;
    bool didLaunch;

    final urlStringWithHttps = _withHttps(urlString);

    try {
      url = Uri.parse(urlStringWithHttps);
      didLaunch = await launchUrl(url);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        ExternalLinkException(error),
        stackTrace,
      );
    }

    if (!didLaunch) throw ExternalLinkFailure(urlStringWithHttps);
  }
}
