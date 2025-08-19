import 'package:aqar_go/domain/model/property.dart';
import 'package:aqar_go/presentation/feature/my_properties/cubit/my_properties_cubit.dart';

class CreateUpdatePostArgs {
  final Property? property;
  final MyPropertiesCubit? myPropertiesCubit;

  CreateUpdatePostArgs({this.property, this.myPropertiesCubit});
}