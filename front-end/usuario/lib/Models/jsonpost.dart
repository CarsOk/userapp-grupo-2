import 'package:usuario/Models/userPost.dart';
import 'package:http/http.dart' as http;

Future<UserPost> registrar(Map<String, dynamic> datos) async {
  final url = Uri.parse('https://fa1bc552e7a9.ngrok.io/user');
  final response = await http.post(url, body: datos);
  if (response.statusCode == 201) {
    return userPostFromJson(response.body);
  } else {
    return null;
  }
}
