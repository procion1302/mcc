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
}*/


enum TaskCategory {
  service('Service', 'Service'),
  waitClient('Waiting client', 'Waiting client'),
  waitEngineer('Waiting engineer', 'Waiting engineer'),
  waitPartner('Waiting partner"', 'Waiting partner"'),
  unknown('Unknown', 'Неизвестно');

  final String key;
  final String description;

  const TaskCategory(this.key, this.description);

  static TaskCategory fromKey(String key) {
    return TaskCategory.values.firstWhere(
      (type) => type.key == key,
      orElse: () => TaskCategory.unknown,
    );
  }
}

enum TaskStatus {
  new_('OP', 'Новая', 'new.svg'),
  opened('Open', 'В работе', 'opened.svg'),
  assigned('AS', 'Назначена', 'assigned.svg'),
  accepted('AC', 'Принята', 'accepted.svg'),
  start('DS', 'Начата', 'start.svg'),
  inProgress('WP', 'В процессе', 'inprogress.svg'),
  closed('Closed', 'Закрыта', 'close.svg'),
  cancelled('Cancelled', 'Отменена', 'close.svg'),
  unknown('Unknown', 'Неизвестно', 'close.svg');

  final String key;
  final String description;
  final String image;

  String get imagePath => 'assets/images/status/$image';

  const TaskStatus(this.key, this.description, this.image);

  static TaskStatus fromKey(String key) {
    return TaskStatus.values.firstWhere(
      (type) => type.key == key,
      orElse: () => TaskStatus.unknown,
    );
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
    return ServiceType.values.firstWhere(
      (type) => type.key == key,
      orElse: () => ServiceType.unknown,
    );
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
    return WorkType.values.firstWhere(
      (type) => type.key == key,
      orElse: () => WorkType.unknown,
    );
  }
}

class ListItem {
  final String taskId;
  final String deviceRegion;
  final String deviceCity;
  final String deviceAddress;
  final String atmId;
  final String engineerContact;
  final TaskStatus status;
  final String incidentStatus;
  final ServiceType serviceType;
  final WorkType workType;
  final TaskCategory category;
  final DateTime openTime;
  final DateTime? pft;

  String get fullAddress {
    final data = <String?>[deviceRegion, deviceCity, deviceAddress];

    return data.where((e) => e != null).join(', ');
  }

  bool get isClosed {
    return status == TaskStatus.closed || status == TaskStatus.cancelled;
  }

  bool get isExpired {
    final pft = this.pft;
    if (pft == null) {
      return false;
    }
    return pft.isBefore(DateTime.now());
  }

  String get subTitle {
    var subTitle = serviceType.key;

    if (workType.description.isNotEmpty) {
      subTitle += subTitle.isEmpty ? '' : ' ';
      subTitle += workType.key;
    }

    return subTitle;
  }

  String get engineerShortName {
    final fio = engineerContact.split(' ');

    if (fio.length != 3) {
      return engineerContact;
    }

    return '${fio[0]} ${fio[1][0]}. ${fio[2][0]}.';
  }

  String imagePath() {
  switch (category) {
    case TaskCategory.service:
      if (isClosed) {
        return 'assets/images/category/service-category.svg';
      } else if (isExpired) {
        return 'assets/images/category/service-category-red.svg';
      } else if (incidentStatus == 'Waiting client') {
        return 'assets/images/category/service-category-yellow .svg';
      } else {
        return 'assets/images/category/service-category-green.svg';
      }

    case TaskCategory.waitClient:
      return 'assets/images/category/client-category.svg';

    case TaskCategory.waitEngineer:
      return 'assets/images/category/eng-category.svg';

    case TaskCategory.waitPartner:
      return 'assets/images/category/partner-category.svg';

    case TaskCategory.unknown:
      return '';
  }
}

  ListItem({
    required this.taskId,
    required this.deviceRegion,
    required this.deviceCity,
    required this.deviceAddress,
    required this.atmId,
    required this.engineerContact,
    required this.status,
    required this.incidentStatus,
    required this.serviceType,
    required this.workType,
    required this.category,
    required this.openTime,
    required this.pft,
  });

  factory ListItem.fromJson(
    Map<String, dynamic> json, {
    bool isIncident = false,
  }) {
    final taskId = isIncident ? json['Number'] : json['TaskID'];
    final deviceRegion = json['DeviceRegion'];
    final deviceCity = json['DeviceCity'];
    final deviceAddress = json['DeviceAddress'];
    final atmId = json['ATMID'];
    final engineerContact = json['EngineerContact'] ?? 'Unknown';
    final status = TaskStatus.fromKey(json['Status'] ?? 'NEW');
    final incidentStatus = json['Status'];
    final serviceType = ServiceType.fromKey(json['ServiceType'] ?? 'Unknown');
    final workType = WorkType.fromKey(json['WorkType'] ?? 'Unknown');
    final category = TaskCategory.fromKey(json['Category'] ?? 'Unknown');
    final openTime = DateTime.parse(json['OpenTime']);
    final pft = json['PFT'] != null
        ? DateTime.parse(json['PFT'] as String)
        : null;

    return ListItem(
      taskId: taskId,
      deviceRegion: deviceRegion,
      deviceCity: deviceCity,
      deviceAddress: deviceAddress,
      atmId: atmId,
      engineerContact: engineerContact,
      status: status,
      incidentStatus: incidentStatus,
      serviceType: serviceType,
      workType: workType,
      category: category,
      openTime: openTime,
      pft: pft,
    );
  }
}
