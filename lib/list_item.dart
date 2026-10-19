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
  waitPartner('Waiting partner', 'Waiting partner'),
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

/*enum TransactionCode: String {
    case repairTimeContractual = "Repair Time contractual"
    case repairTimeChargeable = "Repair Time chargeable"
    case remoteDiagnosisTimeContract = "Remote DiagnosisTime contract"
    case remoteDiagnosisTimeCharge = "Remote DiagnosisTime charge"
    */

enum TransactionCode {
  repairTimeContractual('Repair Time contractual', 'Repair time contractual'),
  repairTimeChargeable('Repair Time chargeable', 'Repair time chargeable'),
  remoteDiagnosisTimeContract('Remote DiagnosisTime contract', 'Remote diagnosis time contractual'),
  remoteDiagnosisTimeCharge('Remote DiagnosisTime charge', 'Remote diagnosis time chargeable');

  final String key;
  final String description;

  const TransactionCode(this.key, this.description);

  static TransactionCode fromKey(String key) {
    return TransactionCode.values.firstWhere(
      (type) => type.key == key,
      orElse: () => TransactionCode.repairTimeContractual,
    );
  }
}

enum ResultCode {
  admin('SU', 'Administrative issue'),
  done('CL', 'Completed'),
  reservePart('ND', 'Spare part needed'),
  consultTss('TS', 'TSS consultation required / software required'),
  addWorks('AC', 'Additional work required'),
  clientWork('CL-Client', 'Customer side work required'),
  cancel('CN', 'Cancel without leaving'),
  paid('COM', 'Paid'),
  withdrawalMoney('SU-NIN', 'Collection required (withdrawal of money from the tract)'),
  unwithdrawalMoney('SU-RNIN', 'Required rainessance and the continuation of the work SLM'),
  repair('CL-SLM', 'Repair work required (transfer from FLM to SLM)');

  final String key;
  final String description;

  const ResultCode(this.key, this.description);

  static ResultCode fromKey(String key) {
    return ResultCode.values.firstWhere(
      (type) => type.key == key,
      orElse: () => ResultCode.admin,
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
  final String? numberId;
  final String caseId;
  final String parentIncident;
  final String deviceRegion;
  final String deviceCity;
  final String deviceAddress;
  final String? deviceSerialNo;
  final String? atmId;
  final String? engineerContact;
  final TaskStatus status;
  final String incidentStatus;
  final ServiceType serviceType;
  final WorkType workType;
  final TaskCategory category;
  final DateTime openTime;
  final DateTime? closeTime;
  final DateTime? resolvedTime;
  final DateTime? pft;
  final DateTime? eta;
  final DateTime? engineerMoveOutTime;
  final DateTime? engineerAcceptedTime;
  final DateTime? repairTimeBegin;
  final DateTime? repairTimeEnd;
  final DateTime? incidentOpenTime;
  final List<String>? description;
  final List<String>? taskOutcome;
  final List<String>? incidentDescription;
  final List<String>? resolution;
  final String? reasonCode;
  final String? finishCode;
  final String? locationCode;
  final String? sectionCode;
  final ResultCode? resultCode;
  final TransactionCode? transactionCode;
  final String? deviceFunctioningFlag;
  final String? engineerDepartureFlag;
  final String? technicianNote;

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
    final engineerContact = this.engineerContact ?? 'Unknown';
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
          return 'assets/images/category/service-category-yellow.svg';
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
        return 'assets/images/category/partner-category.svg';
    }
  }

  String get desc {
    return (description ?? [])
        .where((line) {
          final parts = line.split(':');
          return parts.length != 2 ||
              parts[0].trim().isEmpty ||
              parts[1].trim().isEmpty;
        })
        .join('\n');
  }

  String get incidentDesc {
    return (incidentDescription ?? [])
        .where((line) {
          final parts = line.split(':');
          return parts.length != 2 ||
              parts[0].trim().isEmpty ||
              parts[1].trim().isEmpty;
        })
        .join('\n');
  }

  String get taskOutcomeDesc {
    return (taskOutcome ?? [])
        .where((line) {
          final parts = line.split(':');
          return parts.length != 2 ||
              parts[0].trim().isEmpty ||
              parts[1].trim().isEmpty;
        })
        .join('\n');
  }

        String get resolutionDesc {
          return (resolution ?? [])
          .where((line) {
            final parts = line.split(':');
            return parts.length != 2 ||
            parts[0].trim().isEmpty ||
            parts[1].trim().isEmpty;
          })
          .join('\n');
        }

  ListItem({
    required this.taskId,
    required this.numberId,
    required this.caseId,
    required this.parentIncident,
    required this.deviceRegion,
    required this.deviceCity,
    required this.deviceAddress,
    required this.deviceSerialNo,
    required this.atmId,
    required this.engineerContact,
    required this.status,
    required this.incidentStatus,
    required this.serviceType,
    required this.workType,
    required this.category,
    required this.openTime,
    required this.closeTime,
    required this.resolvedTime,
    required this.pft,
    required this.eta,
    required this.engineerMoveOutTime,
    required this.engineerAcceptedTime,
    required this.repairTimeBegin,
    required this.repairTimeEnd,
    required this.incidentOpenTime,
    required this.description,
    required this.taskOutcome,
    required this.incidentDescription,
    required this.resolution,
    required this.reasonCode,
    required this.finishCode,
    required this.locationCode,
    required this.sectionCode,
    required this.resultCode,
    required this.transactionCode,
    required this.deviceFunctioningFlag,
    required this.engineerDepartureFlag,
    required this.technicianNote,
  });

  factory ListItem.fromJson(
    Map<String, dynamic> json, {
    bool isIncident = false,
  }) {
    final taskId = isIncident ? json['Number'] : json['TaskID'];
    final numberId = json['Number'] as String?;
    final caseId = json['CaseID'] ?? '';
    final parentIncident = json['ParentIncident'] ?? '';
    final deviceRegion = json['DeviceRegion'];
    final deviceCity = json['DeviceCity'];
    final deviceAddress = json['DeviceAddress'];
    final deviceSerialNo = json['DeviceSerialNo'] as String?;
    final atmId = json['ATMID'] as String?;
    final engineerContact = json['EngineerContact'] as String?;
    final status = TaskStatus.fromKey(json['Status'] ?? 'NEW');
    final incidentStatus = json['Status'];
    final serviceType = ServiceType.fromKey(json['ServiceType'] ?? 'Unknown');
    final workType = WorkType.fromKey(json['WorkType'] ?? 'Unknown');
    final category = TaskCategory.fromKey(json['Category'] ?? 'Unknown');
    final openTime = DateTime.parse(json['OpenTime']);
    final closeTime = json['CloseTime'] != null
      ? DateTime.parse(json['CloseTime'] as String)
      : null;
    final resolvedTime = json['ResolvedTime'] != null
      ? DateTime.parse(json['ResolvedTime'] as String)
      : null;
    final pft = json['PFT'] != null
        ? DateTime.parse(json['PFT'] as String)
        : null;
    final eta = json['ETA'] != null
        ? DateTime.parse(json['ETA'] as String)
        : null;
    final engineerMoveOutTime = json['EngineerMoveOutTime'] != null
      ? DateTime.parse(json['EngineerMoveOutTime'] as String)
      : null;
    final engineerAcceptedTime = json['EngineerAcceptedTime'] != null
      ? DateTime.parse(json['EngineerAcceptedTime'] as String)
      : null;
    final repairTimeBegin = json['RepairTimeBegin'] != null
      ? DateTime.parse(json['RepairTimeBegin'] as String)
      : null;
    final repairTimeEnd = json['RepairTimeEnd'] != null
      ? DateTime.parse(json['RepairTimeEnd'] as String)
      : null;
    final incidentOpenTime = json['IncidentOpenTime'] != null
        ? DateTime.parse(json['IncidentOpenTime'] as String)
        : null;
    final description = (json['Description'] as List<dynamic>?)
        ?.whereType<String>()
        .toList();
    final taskOutcome = (json['TaskOutcome'] as List<dynamic>?)
        ?.whereType<String>()
        .toList();
    final incidentDescription = (json['IncidentDescription'] as List<dynamic>?)
      ?.whereType<String>()
      .toList();
    final resolution = (json['Resolution'] as List<dynamic>?)
      ?.whereType<String>()
      .toList();
    final reasonCode = json['ReasonCode'] as String?;
    final finishCode = json['FinishCode'] as String?;
    final locationCode = json['LocationCode'] as String?;
    final sectionCode = json['SectionCode'] as String?;
    final resultCode = json['ResultCode'] != null
        ? ResultCode.fromKey(json['ResultCode'] as String)
        : null;
    final transactionCode = json['TransactionCode'] != null
        ? TransactionCode.fromKey(json['TransactionCode'] as String)
        : null;
    final deviceFunctioningFlag = json['DeviceFunctioningFlag'] as String?;
    final engineerDepartureFlag = json['EngineerDepartureFlag'] as String?;
    final technicianNote = json['TechnicianNote'] as String?;

    return ListItem(
      taskId: taskId,
      numberId: numberId,
      caseId: caseId,
      parentIncident: parentIncident,
      deviceRegion: deviceRegion,
      deviceCity: deviceCity,
      deviceAddress: deviceAddress,
      deviceSerialNo: deviceSerialNo,
      atmId: atmId,
      engineerContact: engineerContact,
      status: status,
      incidentStatus: incidentStatus,
      serviceType: serviceType,
      workType: workType,
      category: category,
      openTime: openTime,
      closeTime: closeTime,
      resolvedTime: resolvedTime,
      pft: pft,
      eta: eta,
      engineerMoveOutTime: engineerMoveOutTime,
      engineerAcceptedTime: engineerAcceptedTime,
      repairTimeBegin: repairTimeBegin,
      repairTimeEnd: repairTimeEnd,
      incidentOpenTime: incidentOpenTime,
      description: description,
      taskOutcome: taskOutcome,
      incidentDescription: incidentDescription,
      resolution: resolution,
      reasonCode: reasonCode,
      finishCode: finishCode,
      locationCode: locationCode,
      sectionCode: sectionCode,
      resultCode: resultCode,
      transactionCode: transactionCode,
      deviceFunctioningFlag: deviceFunctioningFlag,
      engineerDepartureFlag: engineerDepartureFlag,
      technicianNote: technicianNote,
    );
  }
}
