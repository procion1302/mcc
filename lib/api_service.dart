import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:intl/intl.dart';

/*
class ProcessTypeConfig {
  static const Map<String, String> names = {
    'SERVICE_I': 'Service',
    'DOWNLOAD_I': 'Download',
    'UPLOAD_I': 'Upload',
  };

  static const Map<String, String> images = {
    'SERVICE_I': 'assets/images/service.png',
    'DOWNLOAD_I': 'assets/images/service.png',
    'UPLOAD_I': 'assets/images/service.png',
  };

  static String getName(String type) {
    return names[type] ?? type;
  }

  static String getImagePath(String type) {
    return images[type] ?? 'assets/images/service.png';
  }
}

class StoreInfo{
  final String address;
  final String contact;

  StoreInfo({required this.address, required this.contact});

  factory StoreInfo.fromJson(Map<String, dynamic> json) {
    return StoreInfo(
      address: json['storeAddress'] ?? 'No address',
      contact: json['storeContact'] ?? 'No contact',
    );
  }
}

class TspInfo {
  final String inn;
  final String address;

  TspInfo({required this.inn, required this.address});

  factory TspInfo.fromJson(Map<String, dynamic> json) {
    return TspInfo(
      inn: json['tspINN'] ?? '000000',
      address: json['tspAddress'] ?? 'No address',
    );
  }
}

class ListItem {
  final String title;
  final String process;
  final String processType;
  final String actionTitle;
  final String address;

  final String date;
  final String workStarted;
  final String workDone;
  final String createdAt;
  final String client;
  final String tid;
  final String serviceMode;
  final String customerID;
  final String category;
  final String note;

  final StoreInfo storeInfo;
  final TspInfo tspInfo;

  ListItem({
    required this.title,
    required this.process,
    required this.processType,
    required this.actionTitle,
    required this.address,
    required this.date,
    required this.workStarted,
    required this.workDone,
    required this.createdAt,
    required this.client,
    required this.tid,
    required this.serviceMode,
    required this.customerID,
    required this.category,
    required this.note,
    required this.storeInfo,
    required this.tspInfo
  });

  factory ListItem.fromJson(Map<String, dynamic> json) {
    final endAt = json['sla']?[0]?['endAt'];
    final stateCaption = json['stateCaption'] ?? '';
    final rawProcessType = json['stateExt']['type'] ?? '';

    final workDone = json['workDone'];
    final workStarted = json['workStarted'];
    final createdAt = json['createdAt'];


    return ListItem(
      title: json['mainInfo']['sutsRequestNum'] ?? '',
      process: json['processName'] ?? '',
      processType: ProcessTypeConfig.getName(rawProcessType),
      actionTitle: stateCaption.isNotEmpty ? stateCaption : 'Подробнее',
      address: json['timeline'][0]['address'] ?? 'Prishivna St., 23-73',

      date: endAt != null
          ? DateFormat(
              'dd.MM.yyyy',
            ).format(DateTime.fromMillisecondsSinceEpoch(endAt * 1000))
          : '01.01.2025',

      workStarted: workStarted != null
          ? DateFormat(
              'dd.MM.yyyy',
            ).format(DateTime.fromMillisecondsSinceEpoch(workStarted * 1000))
          : '01.01.2025',

      workDone: workDone != null
          ? DateFormat(
              'dd.MM.yyyy',
            ).format(DateTime.fromMillisecondsSinceEpoch(workDone * 1000))
          : '01.01.2025',

      createdAt: createdAt != null
          ? DateFormat(
              'dd.MM.yyyy',
            ).format(DateTime.fromMillisecondsSinceEpoch(createdAt * 1000))
          : '01.01.2025',
      client: json['mainInfo']['customerID'] ?? 'VTB',
      tid: json['tspInfo']['posid'] ?? '000000',

      serviceMode: json['mainInfo']['serviceMode'] ?? 'Standard',
      customerID: json['mainInfo']['customerID'] ?? 'VTB',
      category: json['mainInfo']['category'] ?? 'General',
      note: json['mainInfo']['note'] ?? 'No note available',
      storeInfo: json['storeInfo'] != null
          ? StoreInfo.fromJson(json['storeInfo'])
          : StoreInfo(address: 'No address', contact: 'No contact'),
      tspInfo: json['tspInfo'] != null
          ? TspInfo.fromJson(json['tspInfo'])
          : TspInfo(inn: '000000', address: 'No address')

    );
  }
}*/

enum TaskStatus {
  new_('OP', 'Новая'),
  opened('Open', 'В работе'),
  assigned('AS', 'Назначена'),
  accepted('AC', 'Принята'),
  start('DS', 'Начата'),
  inProgress('WP', 'В процессе'),
  closed('Closed', 'Закрыта'),
  cancelled('Cancelled', 'Отменена'),
  unknown('Unknown', 'Неизвестно');

  final String key;
  final String description;

  const TaskStatus(this.key, this.description);

  static TaskStatus fromKey(String key) {
    return TaskStatus.values.firstWhere((status) => status.key == key);
  }
}

enum ServiceType {
  flm('FLM', 'ФЛМ'),
  slm('SLM', 'СЛМ'),
  cleaning('Cleaning', 'Уборка'),
  otw('OTW', 'ОТВ'),
  counter('Counter', 'Счетчики'),
  ups('UPS', 'ИБП'),
  retial('Retail', 'Ритейл'),
  internalWorks('InternalWorks', 'Внутренние работы'),
  officeServ('Office_serv', 'Офисные услуги'),
  markup('Markup', 'Наценка'),
  unknown('Unknown', 'Неизвестно');

  final String key;
  final String description;

  const ServiceType(this.key, this.description);

  static ServiceType fromKey(String key) {
    return ServiceType.values.firstWhere((type) => type.key == key);
  }
}

enum WorkType {
  asnBrandAss('ASNbrand associated', 'ASNbrand associated'),
  asnBrandUrg('ASNbrand urgent', 'ASNbrand urgent'),
  associated('Associated', 'Associated'),
  claim('Claim', 'Claim'),
  comdev('ComDev', 'ComDev'),
  counter('Counter', 'Counter'),
  filterChng('Filter_chng', 'Filter_chng'),
  logs('Logs', 'Logs'),
  movePaid('MovePaid', 'MovePaid'),   
  moveServ('MoveServ', 'MoveServ'),
  zero1('O1', 'O1'),
  zero1c('O1C', 'O1C'),
  zero2('O2', 'O2'),
  zero2c('O2C', 'O2C'),
  zero3('O3', 'O3'),
  zero7('O7', 'O7'),
  zero7c('O7C', 'O7C'),
  zero9('O9', 'O9'),
  oneTime('OneTime', 'OneTime'),
  pf('PF', 'PF'),
  pfy('PFY', 'PFY'),
  postPP('PostPP', 'PostPP'),
  project('Project', 'Project'),
  standart('Standart', 'Standart'),
  tf('TF', 'TF'),
  typicalConnect('Typical_connect', 'Typical_connect'),
  untypicalConnect('Untypical_connect', 'Untypical_connect'),
  vandal('Vandal', 'Vandal'),
  visit('Visit', 'Visit'),
  vynamicView('VynamicView', 'VynamicView'),
  unknown('Unknown', 'Unknown');

  final String key;
  final String description;

  const WorkType(this.key, this.description);

  static WorkType fromKey(String key) {
    return WorkType.values.firstWhere((type) => type.key == key);
  }
}

class ListItem {
  final String taskId;
  final String deviceRegion;
  final String deviceCity;
  final String deviceAddress;
  final String atmId;
  final TaskStatus status;
  final ServiceType serviceType;
  final WorkType workType; 
  final DateTime openTime;
  final DateTime pft;

  String get fullAddress {
  final data = <String?>[
    deviceRegion,
    deviceCity,
    deviceAddress,
  ];

  return data.where((e) => e != null).join(', ');
}

String get subTitle {
  var subTitle = serviceType.description;

  if (workType.description.isNotEmpty) {
    subTitle += subTitle.isEmpty ? '' : ' ';
    subTitle += workType.description;
  }

  return subTitle;
}

  ListItem({
    required this.taskId,
    required this.deviceRegion,
    required this.deviceCity,
    required this.deviceAddress,
    required this.atmId,
    required this.status,
    required this.serviceType,
    required this.workType,
    required this.openTime,
    required this.pft,
  });

  factory ListItem.fromJson(Map<String, dynamic> json) {
    final taskId = json['TaskID'];
    final deviceRegion = json['DeviceRegion'];
    final deviceCity = json['DeviceCity'];
    final deviceAddress = json['DeviceAddress'];
    final atmId = json['ATMID'];
    final status = TaskStatus.fromKey(json['Status'] ?? 'NEW');
    final serviceType = ServiceType.fromKey(json['ServiceType'] ?? 'Unknown');
    final workType = WorkType.fromKey(json['WorkType'] ?? 'Unknown');
    final openTime = DateTime.parse(json['OpenTime']);
    final pft = DateTime.parse(json['PFT']);

    return ListItem(
      taskId: taskId,
      deviceRegion: deviceRegion,
      deviceCity: deviceCity,
      deviceAddress: deviceAddress,
      atmId: atmId,
      status: status,
      serviceType: serviceType,
      workType: workType,
      openTime: openTime,
      pft: pft,
    );
  }
}

class ApiService {
  static String encoded(String login, String password) {
    return base64Encode(utf8.encode('$login:$password'));
  }

  static Future<String> getAuthorizationHeader({
    required String login,
    required String password,
  }) async {
    final encoded = base64Encode(utf8.encode('$login:$password'));

    final response = await http.get(
      Uri.parse('https://mccm.multicarta.ru/rs/operatorsMobile/$login'),
      headers: {
        'ApplicationID': '0928F721-58AD-4555-912B-D8353CEB4B23',
        'Authorization': 'Basic $encoded',
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.headers['authorization'] ?? "";
    } else {
      throw Exception('Request failed: ${response.statusCode}');
    }
  }

  /*final headers = {
  'ApplicationID': '0928F721-58AD-4555-912B-D8353CEB4B23',
  'Authorization': 'Basic ${encoded(login, password)}',
};*/

  /*
  static Future<List<dynamic>> fetchItems({required String token}) async {
    try {
      final url = Uri.parse(
        'https://blchmobdvl.multicarta.ru/api/process/requests/v2',
      );

      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'ApplicationID': '0928F721-58AD-4555-912B-D8353CEB4B23',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({}),
      );

      //print('STATUS: ${response.statusCode}');
      //print('BODY: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final List list = data['list'];
        return list.map((e) => ListItem.fromJson(e)).toList();
      } else {
        throw Exception('Bad status: ${response.statusCode}');
      }
    } catch (e) {
      //print('REQUEST ERROR: $e');
      rethrow;
    }
  }*/

  static Future<List<dynamic>> fetchTasks({
    required String login,
    required String password,
  }) async {
    try {
      final url = Uri.https('mccm.multicarta.ru', '/rs/incidentTasksMobile', {
        'Open': 'true',
        'AssigneeContact': 'Test_BolshakovRV',
        'Category': 'service',
        'sort': 'TaskID:descending',
        'view': 'expand',
      });

      final response = await http.get(
        url,
        headers: {
          'Authorization':
              'Basic VGVzdF9Cb2xzaGFrb3ZSVjpFNHdNNzVmTQ==', //'Basic ${encoded(login, password)}',
          'Content-Type': 'application/json',
        },
      );

      //print('STATUS: ${response.statusCode}');
      //print('BODY: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        //return []; //TODO: make model
        final List list = data['content'];
        return list.map((e) => ListItem.fromJson(e['IncidentTask'])).toList();
      } else {
        throw Exception('Bad status: ${response.statusCode}');
      }
    } catch (e) {
      print('REQUEST ERROR: $e');
      rethrow;
    }
  }
}
