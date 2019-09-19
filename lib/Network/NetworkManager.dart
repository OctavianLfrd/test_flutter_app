import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:core';

class NetworkManager {

  static final NetworkManager _instance = new NetworkManager();

  static NetworkManager getInstance() {
    return _instance;
  }

  final apiEndpoint = 'https://jsonplaceholder.typicode.com';

  get(String path, Map params) async {
    final uri = _makeUri(path, params);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body);
    }
  }

  String _makeUri(String path, Map params) {
    var newPath = (path.isNotEmpty && path[0] != "/" ? "/" : "") + path;
    if (params.isNotEmpty) {
      if (newPath[newPath.length - 1] == "/")
        newPath = newPath.substring(0, newPath.length - 1);
      newPath += "?";
      params.forEach((key, value) {
        newPath += "$key=$value&";
      });
      newPath = newPath.substring(0, newPath.length - 1);
    }
    final uri = apiEndpoint + newPath;
    return uri;
  }
}
