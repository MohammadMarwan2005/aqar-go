part of 'create_update_post_cubit.dart';

sealed class CreateUpdatePostState extends Equatable {
  final PostFormData formData;

  const CreateUpdatePostState({required this.formData});

  CreateUpdatePostState copyWithFormData(PostFormData formData);

  @override
  List<Object?> get props => [formData];
}

final class CreateUpdatePostInitial extends CreateUpdatePostState {
  const CreateUpdatePostInitial({required super.formData});

  @override
  CreateUpdatePostState copyWithFormData(PostFormData formData) {
    return CreateUpdatePostInitial(formData: formData);
  }
}

final class CreateUpdatePostLoading extends CreateUpdatePostState {
  const CreateUpdatePostLoading({required super.formData});

  @override
  CreateUpdatePostState copyWithFormData(PostFormData formData) {
    return CreateUpdatePostLoading(formData: formData);
  }
}

final class CreateAdLoading extends CreateUpdatePostState {
  const CreateAdLoading({required super.formData});

  @override
  CreateUpdatePostState copyWithFormData(PostFormData formData) {
    return CreateUpdatePostLoading(formData: formData);
  }
}

final class CreateUpdatePostSuccess extends CreateUpdatePostState {
  final Property property;

  const CreateUpdatePostSuccess({
    required super.formData,
    required this.property,
  });

  @override
  CreateUpdatePostState copyWithFormData(PostFormData formData) {
    return CreateUpdatePostSuccess(formData: formData, property: property);
  }

  @override
  List<Object?> get props => [...super.props, property];
}

final class CreateAdSuccess extends CreateUpdatePostState {

  const CreateAdSuccess({
    required super.formData,
  });

  @override
  CreateUpdatePostState copyWithFormData(PostFormData formData) {
    return CreateAdSuccess(formData: formData);
  }

  @override
  List<Object?> get props => [...super.props];
}

final class CreateUpdatePostError extends CreateUpdatePostState {
  final bool isSnackBar;
  final DomainError error;

  const CreateUpdatePostError({required super.formData, required this.error, this.isSnackBar = false});

  @override
  CreateUpdatePostState copyWithFormData(PostFormData formData) {
    return CreateUpdatePostInitial(formData: formData,
        /*error: error, isSnackBar: isSnackBar*/
    );
  }

  @override
  List<Object?> get props => [...super.props, error, isSnackBar];
}
