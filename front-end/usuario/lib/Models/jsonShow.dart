import 'package:http/http.dart' as http;
import 'package:usuario/Models/userShow.dart';

Future<UserShow> showComment(int id) async {
  print("este es mi id $id");
  final url = Uri.parse(
    'https://6d146faafce5.ngrok.io/user/$id ',
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
