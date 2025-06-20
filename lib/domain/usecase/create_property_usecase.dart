import 'package:aqar_go/domain/model/media_file.dart';
import 'package:aqar_go/domain/model/property.dart';
import 'package:aqar_go/domain/model/resource.dart';

import '../repo/property_repo.dart';

class CreatePropertyUsecase {

  final PropertyRepo _propertyRepo;

  CreatePropertyUsecase(this._propertyRepo);

  // todo, do the creating logic
  // note: you may need to handle edit in the same fun... in that case, rename the usecase
  Future<Resource<Property>> call(Property property,
      List<MediaFile> mediaFiles,) async {
    final response = await _propertyRepo.createProperty(property);
    return response;
  }
}
