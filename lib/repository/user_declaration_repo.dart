import 'package:dio/dio.dart';

class UserDeclarationPost {
  var dio = Dio();

  Future postData(String fullname,String gender,String birthday,String cccd,String phone,String email,String address ) async {
    var res = await dio.post('http://192.168.1.8:3000/user',
        data: FormData.fromMap({
          "fullname": fullname,
          "gender": gender,
          "birthday": birthday,
          "CCCD": cccd,
          "phone": phone,
          "email": email,
          "address": address
        }),
        options: Options(
            headers: {'Content-type': 'application/json; charset=UTF-8'}));
    return res.data;
  }
}
