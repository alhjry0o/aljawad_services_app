class ServiceRequestModel {
  final String id;
  final String serviceTitle;
  final String type; // service, quotation, inspection
  final String siteType;
  final String city;
  final String address;
  final String date;
  final String time;
  final String clientName;
  final String clientPhone;
  final String status;

  ServiceRequestModel({
    required this.id,
    required this.serviceTitle,
    required this.type,
    required this.siteType,
    required this.city,
    required this.address,
    required this.date,
    required this.time,
    required this.clientName,
    required this.clientPhone,
    required this.status,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'serviceTitle': serviceTitle,
    'type': type,
    'siteType': siteType,
    'city': city,
    'address': address,
    'date': date,
    'time': time,
    'clientName': clientName,
    'clientPhone': clientPhone,
    'status': status,
  };

  factory ServiceRequestModel.fromJson(Map<String, dynamic> json) => ServiceRequestModel(
    id: json['id'],
    serviceTitle: json['serviceTitle'],
    type: json['type'],
    siteType: json['siteType'],
    city: json['city'],
    address: json['address'],
    date: json['date'],
    time: json['time'],
    clientName: json['clientName'],
    clientPhone: json['clientPhone'],
    status: json['status'],
  );
}