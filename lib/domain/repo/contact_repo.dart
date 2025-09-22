import 'package:aqar_go/domain/model/resource.dart';

abstract class ContactRepo {
  Future<Resource<String>> getTelegramLink();
  Future<Resource<String>> getTelegramUsername();
}
