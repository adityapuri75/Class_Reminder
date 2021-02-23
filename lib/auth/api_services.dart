import 'package:class_project/model/suggestion.dart';
import 'package:class_project/model/timetable.dart';
import 'package:class_project/model/user.dart';
import 'package:dio/dio.dart';

class ApiService {
  Dio dio = new Dio();

  var url = "https://college-project-madadi.herokuapp.com";
  //602bfec67741c300157752a3

  Future<User> getUserDetails(String id) async {
    User data;
    try {
      var response = await dio.get(
        url + "/" + "user/" + id,
        options: new Options(contentType: Headers.jsonContentType),
      );
      if (response.statusCode == 200) {
        data = User.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

  Future<User> updateUserDetails(
      String id, String section, String group) async {
    User data;
    try {
      var response = await dio.put(
        url + "/user/" + "user" + id,
        data: {
          "section": section,
          "group": group,
        },
        options: new Options(contentType: Headers.jsonContentType),
      );
      if (response.statusCode == 200) {
        data = User.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

 Future<List<Feedback>> getSuggestion() async {
    List<Feedback> data;
    try {
      var response = await dio.get(
        url + "/suggestion",
        options: new Options(contentType: Headers.jsonContentType),
      );

      // data = suggestionFromJson(response.data);
      // print(response.data);
      data =
          (response.data as List).map((e) => Feedback.fromJson(e)).toList();
      // data = Suggestion.fromJson(response.data);
      print(data);
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

  Future<List<TimeTable>> getTimeTable(
      String section, String date, String group) async {
    List<TimeTable> data;

    print(date);
    try {
      var response = await dio.get(
        url + "/timeTable/section/" + section + "/" + group + "/" + date,
        // url + "/timeTable/section/r/2/2-17-2021",
        options: new Options(contentType: Headers.jsonContentType),
      );
      if (response.statusCode == 200) {
        data =
            (response.data as List).map((e) => TimeTable.fromJson(e)).toList();
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return data;
  }

  Future saveUserDetail(String name, String email, String section, String group,
      String university, String image) async {
    var response = await dio.post(
      url + "/user",
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

  void feedback(
    String msg,
    String section,
    String group,
  ) async {
    await dio.post(
      url + "/suggestion",
      data: {
        "feedback": msg,
        "section": section,
        "group": group,
      },
      options: new Options(contentType: Headers.jsonContentType),
    );
  }
}
