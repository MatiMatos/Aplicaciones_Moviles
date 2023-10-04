import 'package:http/http.dart' as http;
import 'dart:convert';

class MonedasProvider {
  // nombre descriptivo
  final apiUrl =
      'https://api.gael.cloud/general/public/monedas'; // url del caso

  Future<List<dynamic>> getMonedas() async {
    var url = Uri.parse(apiUrl);
    var respuesta = await http.get(url);

    // 200 esenario ideal, 400 error del programador, 500 lo contrario
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<double> getValorMonedas(String codigoMoneda) async {
    var url = Uri.parse(apiUrl + '/' + codigoMoneda);
    var respuesta = await http.get(url);
    var moneda = json.decode(respuesta.body);
    return double.parse(moneda['Valor'].replaceAll(',', '.'));
  }
}
