class ServerStatus {
  final String name;
  final String description;
  final String status;
  final DateTime lastUpdate;

  const ServerStatus({
    required this.name,
    required this.description,
    required this.status,
    required this.lastUpdate,
  });

  factory ServerStatus.fromJson(Map<String, dynamic> json) {
    return ServerStatus(
      name: json['name'],
      description: json['description'],
      status: json['status'],
      lastUpdate: DateTime.parse(json['lastUpdate'].toString()),
    );
  }
}