import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import '../model/author.dart';

class API {
  //static String _BASE_URL = 'https://flutterducat.000webhostapp.com/api.php';
 /* Sends an HTTP POST request with the given headers and body to the given URL, which can be a Uri or a String.
  body sets the body of the request. It can be a String, a List  or a Map<String, String>. If it's a String, it's encoded using encoding and used as the body of the request. The content-type of the request will default to "text/plain".
  If body is a List, it's used as a list of bytes for the body of the request.
  If body is a Map, it's encoded as form fields using encoding. The content-type of the request will be set to "application/x-www-form-urlencoded"; this cannot be overridden.
  encoding defaults to utf8.
  For more fine-grained control over the request, use Request or StreamedRequest instead.
  Dart Packages*/
  static Future<Author> createAuthor(String name) async {
    final Response response = await post('https://flutterducat.000webhostapp.com/api.php',
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
        body: jsonEncode(<String, String>{"name": name}));
    if (response.statusCode == 200) {
      var msg=response.body;
      Fluttertoast.showToast(
          msg: msg.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1
      );
      print(response.body);
      return Author.fromJson(json.decode(response.body));
    } else {

      Fluttertoast.showToast(
          msg: 'Error Occured',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1
      );
      print('Error');
      throw Exception("Can't load author");
    }
  }
}
