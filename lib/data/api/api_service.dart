import 'package:dio/dio.dart';
import 'package:lms/data/model/course/course_model.dart';
import 'package:lms/data/model/course_detail/course_detail_model.dart';
import 'package:lms/data/model/course_taken/course_taken_model.dart';
import 'package:lms/data/model/request_course/request_course_model.dart';
import 'package:lms/data/model/user/user_model.dart';

import '../model/login/login_model.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = "https://capstone-project-4.herokuapp.com/api";
    _dio.options.receiveDataWhenStatusError = true;
    _dio.options.connectTimeout = 20 * 1000;
    _dio.options.receiveTimeout = 60 * 1000;
  }

  Future<LoginModel> login(String email, String password) async {
    try {
      Response response = await _dio.request(
        "/auth/signin",
        options: Options(method: 'POST'),
        data: {"email": email, "password": password},
      );

      if (response.statusCode == 200) {
        return LoginModel.fromJson(response.data);
      } else {
        return LoginModel(timestamp: "", message: "Failed to login");
      }
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        return LoginModel(timestamp: "", message: "Connection timeout");
      }
      return LoginModel(timestamp: "", message: ex.message);
    }
  }

  Future<UserModel> getUser(String token) async {
    try {
      Response response = await _dio.request(
        "/users",
        options: Options(
          method: 'GET',
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        return UserModel(timestamp: "", message: "");
      }
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        return UserModel(timestamp: "", message: "Connection timeout");
      }
      return UserModel(timestamp: "", message: ex.message);
    }
  }

  Future<CourseTakenModel> getCourseTaken(String token) async {
    try {
      Response response = await _dio.request(
        "/course-takens/history",
        options: Options(
          method: 'GET',
          validateStatus: (status) {
            return status! <= 500;
          },
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200) {
        return CourseTakenModel.fromJson(response.data);
      } else {
        return CourseTakenModel.fromJson(response.data);
      }
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        return CourseTakenModel(timestamp: "", message: "Connection timeout", data: []);
      }
      return CourseTakenModel(timestamp: "", message: ex.message, data: []);
    }
  }

  Future<CourseTakenModel> getCourseTakenById(String token, idCourseTaken) async {
    try {
      Response response = await _dio.request(
        "/course-takens/$idCourseTaken",
        options: Options(
          method: 'GET',
          validateStatus: (status) {
            return status! <= 500;
          },
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200) {
        return CourseTakenModel.fromJson(response.data);
      } else {
        return CourseTakenModel.fromJson(response.data);
      }
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        return CourseTakenModel(timestamp: "", message: "Connection timeout", data: []);
      }
      return CourseTakenModel(timestamp: "", message: ex.message, data: []);
    }
  }

  Future<CourseModel> getAllCourses(String token) async {
    try {
      Response response = await _dio.request(
        "/courses",
        options: Options(
          method: 'GET',
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200) {
        return CourseModel.fromJson(response.data);
      } else {
        return CourseModel(timestamp: "", message: "", data: []);
      }
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        return CourseModel(timestamp: "", message: "Connection timeout", data: []);
      }
      return CourseModel(timestamp: "", message: ex.message, data: []);
    }
  }

  Future<CourseDetailModel> getCourseDetail(String token, int id) async {
    try {
      Response response = await _dio.request(
        "/courses/$id",
        options: Options(
          method: 'GET',
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200) {
        return CourseDetailModel.fromJson(response.data);
      } else {
        return CourseDetailModel(timestamp: "", message: "");
      }
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        return CourseDetailModel(timestamp: "", message: "Connection timeout");
      }
      return CourseDetailModel(timestamp: "", message: ex.message);
    }
  }

  Future<RequestCourseModel> requestCourse(
      String token, int idCourse, int requestType, String requestDetail) async {
    try {
      Response response = await _dio.request(
        "/course-takens",
        options: Options(
          method: 'POST',
          headers: {"Authorization": "Bearer $token"},
        ),
        data: {
          "request_type": requestType,
          "course_id": idCourse,
          "request_detail": requestDetail,
        },
      );

      if (response.statusCode == 201) {
        return RequestCourseModel.fromJson(response.data);
      } else {
        return RequestCourseModel(timestamp: "", message: "");
      }
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        return RequestCourseModel(timestamp: "", message: "Connection timeout");
      }
      return RequestCourseModel(timestamp: "", message: ex.message);
    }
  }

  Future<UserModel> editProfile(
      String token, String name, String phone, String imageUrl, UserDataAddress address) async {
    try {
      Response response = await _dio.request(
        "/users/edit",
        options: Options(
          method: 'PUT',
          headers: {"Authorization": "Bearer $token"},
        ),
        data: {
          "name": name,
          "phone_number": phone,
          "image_url": imageUrl,
          "address": address.toJson()
        },
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        return UserModel(timestamp: "", message: "Failed to update");
      }
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        return UserModel(timestamp: "", message: "Connection timeout");
      }
      return UserModel(timestamp: "", message: ex.message);
    }
  }

  Future<RequestCourseModel> editRatingCourse(String token, int idCourseTaken, double rate) async {
    try {
      Response response = await _dio.request(
        "/course-takens/rates/$idCourseTaken",
        options: Options(
          method: 'PUT',
          headers: {"Authorization": "Bearer $token"},
        ),
        data: {"rate": rate},
      );

      if (response.statusCode == 200) {
        return RequestCourseModel.fromJson(response.data);
      } else {
        return RequestCourseModel(timestamp: "", message: "Failed to update");
      }
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        return RequestCourseModel(timestamp: "", message: "Connection timeout");
      }
      return RequestCourseModel(timestamp: "", message: ex.message);
    }
  }

  Future<UserModel> changePassword(String token, String currentPassword, String newPassword) async {
    try {
      Response response = await _dio.request(
        "/users/change-password",
        options: Options(
          method: 'PUT',
          validateStatus: (status) {
            return status! <= 500;
          },
          headers: {"Authorization": "Bearer $token"},
        ),
        data: {
          "current_password": currentPassword,
          "new_password": newPassword,
        },
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        return UserModel.fromJson(response.data);
      }
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        return UserModel(timestamp: "", message: "Connection timeout");
      }
      return UserModel(timestamp: "", message: ex.message);
    }
  }
}
