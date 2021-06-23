import 'package:http/http.dart' as http;
import 'package:usuario/Models/userShow.dart';

Future<UserShow> showComment(int id) async {
  final url = Uri.parse(
    'https://d5e628e59660.ngrok.io/user/$id',
  );
  final respuesta = await http.get(
    url,
  );
  print(respuesta.statusCode);

  if (respuesta.statusCode == 200) {
    return userShowFromJson(respuesta.body);
  } else {
    return null;
  }
}
