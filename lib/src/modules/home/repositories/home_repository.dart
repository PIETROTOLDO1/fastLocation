import 'package:dio/dio.dart';
import 'package:fastlocation/src/http/app_dio.dart';

class HomeRepository with AppDio {
  Future<Response> getAddressViaCep(String cep) async {
    String baseURL = 'https://viacep.com.br/ws';

    Dio clientHTTP = await AppDio.getConnection();
    
    Response response = await clientHTTP.get('$baseURL/$cep/json');

    return response;
  }
}