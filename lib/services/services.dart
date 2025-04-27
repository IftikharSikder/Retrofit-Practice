import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit_practice/models/user.dart';

part 'services.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/posts')
  Future<List<Users>> getUsers();
}

