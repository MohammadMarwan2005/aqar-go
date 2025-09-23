import 'package:aqar_go/domain/model/resource.dart';
import '../../data/model/links/aqar_go_links.dart';

abstract class ContactRepo {
  Future<Resource<String>> getTelegramLink();
  Future<Resource<String>> getTelegramUsername();
  Future<Resource<AqarGoLinks>> getAqarGoLinks();
}
