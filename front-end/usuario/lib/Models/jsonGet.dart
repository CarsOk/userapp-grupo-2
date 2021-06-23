import 'package:http/http.dart' as http;
import 'package:usuario/Models/userGet.dart';

Future<List<User>> getComment() async {
  final url = Uri.parse(
    'https://1909bec19dec.ngrok.io/user',
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
