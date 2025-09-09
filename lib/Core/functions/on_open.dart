import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> onOpen(LinkableElement link) async {
  final uri = Uri.parse(link.url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $link';
  }
}
