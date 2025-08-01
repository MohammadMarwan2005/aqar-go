import 'package:aqar_go/domain/model/media_file.dart';
import 'package:aqar_go/domain/model/property.dart';
import 'package:aqar_go/domain/model/resource.dart';
import '../../presentation/feature/create_update_post/post_form_data.dart';
import '../repo/property_repo.dart';

class CreateUpdatePropertyUsecase {
  final PropertyRepo _propertyRepo;

  CreateUpdatePropertyUsecase(this._propertyRepo);

  Future<Resource<Property>> call(
    PostFormData formData,
    // the data in the ui form
    List<MediaFile> mediaFiles,
    List<int> toDeleteImagesIds,
    bool isUpdate,
    Property? property, // when the property is not null => update...
  ) async {
    final area = int.parse(formData.area);
    final locationId = formData.locationId ?? -1;
    final price = int.parse(formData.price);
    final title = formData.title;
    final description = formData.description;
    final propertable = formData.getPropertable();

    final requestProperty = Property(
      id: property?.id ?? 0,
      userId: property?.userId ?? 0,
      locationId: locationId,
      propertableId: property?.propertableId ?? 0,
      area: area,
      price: price,
      title: title,
      description: description,
      propertable: propertable,
      images: mediaFiles,
    );

    final response =
        (isUpdate)
            ? await _propertyRepo.updateProperty(
              requestProperty,
              toDeleteImagesIds,
            )
            : await _propertyRepo.createProperty(requestProperty);

    return response;
  }
}
