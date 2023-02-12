class ServerException implements Exception {
  final String message;

  ServerException({required this.message});

  factory ServerException.fromJson(Map<String, dynamic> json) {
    try {
      return ServerException(message: json["data"]);
    } catch (e, s) {
      print(s);

    }
    return ServerException(message: "");
    return ServerException(message: json['data']);
  }
}

class ServerTokenException implements Exception {
  final String message;

  ServerTokenException({required this.message});

  factory ServerTokenException.fromJson(Map<String, dynamic> json) {
    return ServerTokenException(message: json['data']);
  }
}

class NoInternetException implements Exception {}

class CacheException implements Exception {
  final String message;

  CacheException({required this.message});

  @override
  String toString() {
    return message;
  }
}
