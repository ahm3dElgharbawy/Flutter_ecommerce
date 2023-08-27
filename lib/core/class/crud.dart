import "dart:convert";

import "package:dartz/dartz.dart";
import 'package:ecommerce/core/class/request_status.dart';
import 'package:ecommerce/core/functions/check_connection.dart';
import "package:http/http.dart" as http;

class Crud {
  // @return error message or map of data
  Future<Either<RequestStatus, Map>> postData(String url, Map data) async {

    try {

      if (await checkConnection()) {

        http.Response response = await http.post(Uri.parse(url), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(RequestStatus.error);
        }
      } else {
        return const Left(RequestStatus.offline);
      }
    } catch (e) {
      return const Left(RequestStatus.serverError);
    }
  }
}
