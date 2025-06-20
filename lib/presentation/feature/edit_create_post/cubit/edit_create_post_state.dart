part of 'edit_create_post_cubit.dart';

sealed class EditCreatePostState extends Equatable {
  final PostFormData formData;

  const EditCreatePostState({required this.formData});

  EditCreatePostState copyWithFormData(PostFormData formData);

  @override
  List<Object?> get props => [formData];
}

final class EditCreatePostInitial extends EditCreatePostState {
  const EditCreatePostInitial({required super.formData});

  @override
  EditCreatePostState copyWithFormData(PostFormData formData) {
    return EditCreatePostInitial(formData: formData);
  }
}

final class EditCreatePostLoading extends EditCreatePostState {
  const EditCreatePostLoading({required super.formData});

  @override
  EditCreatePostState copyWithFormData(PostFormData formData) {
    return EditCreatePostLoading(formData: formData);
  }
}

final class EditCreatePostSuccess extends EditCreatePostState {
  final Property property;

  const EditCreatePostSuccess({
    required super.formData,
    required this.property,
  });

  @override
  EditCreatePostState copyWithFormData(PostFormData formData) {
    return EditCreatePostSuccess(formData: formData, property: property);
  }

  @override
  List<Object?> get props => [...super.props, property];
}

final class EditCreatePostError extends EditCreatePostState {
  final bool isSnackBar;
  final DomainError error;

  const EditCreatePostError({required super.formData, required this.error, this.isSnackBar = false});

  @override
  EditCreatePostState copyWithFormData(PostFormData formData) {
    return EditCreatePostInitial(formData: formData,
        /*error: error, isSnackBar: isSnackBar*/
    );
  }

  @override
  List<Object?> get props => [...super.props, error, isSnackBar];
}
