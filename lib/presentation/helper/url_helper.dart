import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(String url, Function() onFailure) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    onFailure();
  }
}

String getGoogleMapsUrl(double lat, double long) =>
    "https://www.google.com/maps/search/?api=1&query=$lat,$long";

String getWhatsappUrl(String number) {
  final numberWithCode =
      number.startsWith("0") ? "963${number.substring(1)}" : number;
  // return "whatsapp://send?phone=$numberWithCode";
  return "https://wa.me/$numberWithCode";
}

String getCallUrl(String number) => "tel:$number";

String getTelegramUrl(String username) => "https://t.me/$username";
