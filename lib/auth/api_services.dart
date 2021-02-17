import 'package:dio/dio.dart';

class ApiService {
  Dio dio = new Dio();

  var url = "https://college-project-madadi.herokuapp.com";

  Future saveUserDetail(String name, String email, String section, String group,
      String university, String image) async {
    var response = await dio.post(
      url + "user",
      data: {
        "name": name,
        "email": email,
        "section": section,
        "group": group,
        "university": university,
        "image": image
      },
      options: new Options(contentType: Headers.jsonContentType),
    );

    if (response.statusCode == 201) {
      return response.data;
    }
  }
}
