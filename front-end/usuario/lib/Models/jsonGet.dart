import 'package:http/http.dart' as http;
import 'package:usuario/Models/userGet.dart';

Future<List<User>> getComment(json) async {
  final url = Uri.parse(
    'https://17a4b695e99a.ngrok.io/comments2',
  );
  final respuesta = await http.get(
    url,
  );
  print(respuesta.statusCode);

  if (respuesta.statusCode == 200) {
    return userFromJson(respuesta.body);
  } else {
    return null;
  }
}
