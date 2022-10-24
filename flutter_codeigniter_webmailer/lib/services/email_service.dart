part of 'services.dart';

class EmailService {
  static Future<http.Response> sendMail(String email) => http.post(
      Uri.https(BaseUrl.baseUrl, "/pkrishnacahya/week5/cirestapi/api/mahasiswa/sendmail"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          'email': email,
        },
      ),
    );
}
