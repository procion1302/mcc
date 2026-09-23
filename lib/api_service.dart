import 'dart:convert';
import 'package:http/http.dart' as http;
import 'list_item.dart';
//import 'package:intl/intl.dart';

class ApiService {
  static String? _login;
  static String? _password;

  static String encoded(String login, String password) {
    return base64Encode(utf8.encode('$login:$password'));
  }

  static Future<String> getAuthorizationHeader({
    required String login,
    required String password,
  }) async {

    _login = login;
    _password = password;

    final response = await http.get(
      Uri.parse('https://mccm.multicarta.ru/rs/operatorsMobile/$login'),
      headers: {
        'ApplicationID': '0928F721-58AD-4555-912B-D8353CEB4B23',
        'Authorization': 'Basic ${encoded(login, password)}',
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.headers['authorization'] ?? "";
    } else {
      throw Exception('Request failed: ${response.statusCode}');
    }
  }

  static Future<List<dynamic>> fetchTasks() async {
    if (_login == null || _password == null) {
      throw Exception('ApiService is not authorized');
    }

    final url = Uri.https('mccm.multicarta.ru', '/rs/incidentTasksMobile', {
      'Open': 'true',
      'AssigneeContact': _login!,
      'Category': 'service',
      'sort': 'TaskID:descending',
      'view': 'expand',
    });

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Basic ${encoded(_login!, _password!)}',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List list = data['content'];

      return list
          .map((e) => ListItem.fromJson(e['IncidentTask']))
          .toList();
    } else {
      throw Exception('Bad status: ${response.statusCode}');
    }
  }

  static Future<List<dynamic>> fetchIncidents() async {
    if (_login == null || _password == null) {
      throw Exception('ApiService is not authorized');
    }

    final url = Uri.https('mccm.multicarta.ru', '/rs/incidentsMobile', {
      'view': 'expand',
      'query': 'Partner="ТЕСТОВАЯ КОМПАНИЯ" and Open=true'
    });

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Basic ${encoded(_login!, _password!)}',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List list = data['content'];

      return list
          .map((e) => ListItem.fromJson(e['Incident']))
          .toList();
    } else {
      throw Exception('Bad status: ${response.statusCode}');
    }
  }
}