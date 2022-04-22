import 'package:string_validator/string_validator.dart';
import 'package:url_launcher/url_launcher.dart';

void urlLauncher(String value) {
  if (isURL(value)) {
    launch(value);
  }
  else{
    Uri uri = Uri(host: 'www.google.com', path: '/search', queryParameters: {'q': value});
    launch(uri.toString());
  }
}
