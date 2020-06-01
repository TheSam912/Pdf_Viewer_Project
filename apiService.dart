import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static final String URL = "http://www.africau.edu/images/default/sample.pdf";

  static Future<String> loadPdf() async {
    var response = await http.get(URL);

    var dir = await getApplicationDocumentsDirectory();
    File file = new File("${dir.path}/data.pdf");
    file.writeAsBytesSync(response.bodyBytes, flush: true);
    return file.path;
  }
}
