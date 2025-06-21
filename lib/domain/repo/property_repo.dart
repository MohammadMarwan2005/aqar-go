import 'package:aqar_go/domain/model/media_file.dart';
import 'package:aqar_go/domain/model/property.dart';
import 'package:aqar_go/domain/model/resource.dart';

abstract class PropertyRepo {
  Future<Resource<Property>> createProperty(Property property);
  Future<Resource<Property>> updateProperty(Property property, List<int> toDeleteIds);

  Future<Resource<List<Property>>> getUserProperties();
}
