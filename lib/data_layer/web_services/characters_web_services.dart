import 'package:breaking_bad/constants/strings.dart';
import 'package:dio/dio.dart';

class CharacterWebService {
  late Dio dio;

  CharacterWebService() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, //220sec
      receiveTimeout: 20 * 1000, //20sec
    );
    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get(CHARACTERS);
      //  print(response.data[0].runtimeType);
      return response.data;
    } catch (e) {
      return [];
    }
  }

  Future<List<dynamic>> getAllCharacterQuotes(String characterName) async {
    try {
      Response response = await dio.get('quote',queryParameters: {'author':characterName});//make query as map because may be more than query
      return response.data;
    } catch (e) {
      return [];
    }
  }
}
