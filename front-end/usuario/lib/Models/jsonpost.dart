import 'package:usuario/Models/userPost.dart';
import 'package:http/http.dart' as http;

Future<UserPost> registrar(Map<String, dynamic> datos) async {
  final url = Uri.parse('https://1909bec19dec.ngrok.io/user');
  final response = await http.post(url, body: datos);
  if (response.statusCode == 201) {
    return userPostFromJson(response.body);
  } else {
    return null;
  }
}
