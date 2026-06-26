import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper {
   static Future<void> openUrl(String url) async {
    final uri = Uri.tryParse(url);

    if (uri == null) return;

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );}

  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri uri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }
}