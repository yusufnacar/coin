import '../constants/enums/http_enum.dart';

extension NetworkTypeExtension on HttpTypes? {
  String get rawValue {
    switch (this) {
      case HttpTypes.GET:
        return 'GET';
      case HttpTypes.POST:
        return 'POST';
      case HttpTypes.PUT:
        return 'PUT';
      case HttpTypes.DELETE:
        return 'DELETE';
      default:
        throw 'ERROR TYPE';
    }
  }
}
