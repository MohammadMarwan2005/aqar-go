import 'package:aqar_go/common/helpers/logging_helper.dart';
import 'package:aqar_go/common/helpers/navigation_helper.dart';
import 'package:aqar_go/common/helpers/ui_helper.dart';
import 'package:aqar_go/common/helpers/validation_helper.dart';
import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:aqar_go/domain/model/property.dart';
import 'package:aqar_go/presentation/assets/property_widgets_helper.dart';
import 'package:aqar_go/presentation/feature/edit_create_post/cubit/edit_create_post_cubit.dart';
import 'package:aqar_go/presentation/feature/media_picker/image_picker_widget.dart';
import 'package:aqar_go/presentation/feature/media_picker/media_picker_cubit.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/widgets/app_button.dart';
import 'package:aqar_go/presentation/widgets/app_text_field.dart';
import 'package:aqar_go/presentation/widgets/screen_horizontal_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditCreatePostScreen extends StatelessWidget {
  const EditCreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EditCreatePostCubit>();
    final mediaCubit = context.read<MediaPickerCubit>();
    return BlocConsumer<EditCreatePostCubit, EditCreatePostState>(
      listener: (context, state) {
        switch (state) {
          case EditCreatePostInitial():
            return;
          case EditCreatePostLoading():
            return;
          case EditCreatePostSuccess():
            context.showMySnackBar("Post uploaded successfully!");
            context.popRoute();
            return;
          case EditCreatePostError(
            error: final error,
            isSnackBar: final isSnackBar,
          ):
            if (isSnackBar) {
              context.showMySnackBar(error.getMessage(context));
            } else {
              context.showMyAlertDialogFromDomainError(error);
            }
        }
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: AppButton(
              isLoading: state is EditCreatePostLoading,
              onPressed: () {
                final images = context.read<MediaPickerCubit>().state.files;
                final toDeleteImagesIds = context.read<MediaPickerCubit>().state.toDeleteImagesIds;
                cubit.createOrUpdatePost(images, toDeleteImagesIds);
              },
              text: cubit.isUpdate ? "Update".tr(context) : "Post".tr(context),
            ),
          ),
          appBar: AppBar(title: Text("Edit/Add Post")),
          body: SafeArea(
            child: SingleChildScrollView(
              child: ScreenPadding(
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // property stuff:
                      PropertyFields(cubit: cubit, state: state),
                      _LocalSizedBox(),
                      PropertableSelector(
                        selectedType: state.formData.selectedPropertableEnum,
                        onSelect: (newValue) {
                          cubit.updateFormData((currentFormData) {
                            return currentFormData.copyWith(
                              selectedPropertableEnum: newValue,
                            );
                          });
                        },
                      ),
                      _LocalSizedBox(),
                      PropertableFields(cubit: cubit, state: state),
                      SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class PropertyFields extends StatelessWidget {
  final EditCreatePostCubit cubit;
  final EditCreatePostState state;

  const PropertyFields({super.key, required this.cubit, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImagePickerWidget(),
        _LocalSizedBox(),
        // do the same like this...:
        AppTextField(
          initialValue: state.formData.title,
          onChanged: (value) {
            cubit.updateFormData(
              (currentFormData) => currentFormData.copyWith(title: value),
            );
          },
          validator: (value) => value.validateNotEmpty()?.tr(context),
          labelText: "Title".tr(context),
        ),
        _LocalSizedBox(),
        AppTextField(
          initialValue: state.formData.description,
          onChanged: (value) {
            cubit.updateFormData(
              (current) => current.copyWith(description: value),
            );
          },
          validator: (value) => value.validateNotEmpty()?.tr(context),
          labelText: "Description".tr(context),
        ),
        _LocalSizedBox(),
        AppTextField(
          initialValue: state.formData.price,
          onChanged: (value) {
            cubit.updateFormData((current) => current.copyWith(price: value));
          },
          labelText: "Price".tr(context),
          validator: (value) => value.validatePrice()?.tr(context),
          keyboardType: TextInputType.number,
        ),
        _LocalSizedBox(),
        AppTextField(
          initialValue: state.formData.area,
          onChanged: (value) {
            cubit.updateFormData((current) => current.copyWith(area: value));
          },
          labelText: "Area in m^2".tr(context),
          validator: (value) => value.validateArea()?.tr(context),
          keyboardType: TextInputType.number,
        ),
        _LocalSizedBox(),

        AppTextField(
          initialValue: state.formData.locationId.toString(),
          onChanged: (value) {
            cubit.updateFormData(
              (current) =>
                  current.copyWith(locationId: int.tryParse(value ?? "-1")),
            );
          },
          labelText: "LocationId (Temp)".tr(context),
          validator: (value) => value.validateArea()?.tr(context),
          keyboardType: TextInputType.number,
        ),
        _LocalSizedBox(),
      ],
    );
  }
}

class _LocalSizedBox extends StatelessWidget {
  const _LocalSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 16);
  }
}

class PropertableSelector extends StatelessWidget {
  final PropertableEnum selectedType;
  final void Function(PropertableEnum newValue) onSelect;

  const PropertableSelector({
    super.key,
    required this.selectedType,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            PropertableEnum.values.map((e) {
              final isSelected = e == selectedType;

              final backgroundColor =
                  isSelected
                      ? Theme.of(context).colorScheme.inversePrimary
                      : Theme.of(
                        context,
                      ).colorScheme.inversePrimary.withOpacity(0.35);
              final borderColor =
                  isSelected ? colorScheme.primary : Colors.transparent;

              final iconTextColor =
                  isSelected ? colorScheme.primary : colorScheme.onSurface;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: InkWell(
                  onTap: () => onSelect(e),
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    constraints: const BoxConstraints(
                      minWidth: 80,
                      minHeight: 80,
                    ),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: borderColor, width: 2),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        e.getIcon().svg(
                          width: 32,
                          height: 32,
                          colorFilter: ColorFilter.mode(
                            iconTextColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          e.labelId,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: iconTextColor,
                            fontWeight:
                                isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}

class PropertableFields extends StatelessWidget {
  final EditCreatePostCubit cubit;
  final EditCreatePostState state;

  const PropertableFields({
    super.key,
    required this.cubit,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return state.formData.selectedPropertableEnum.getFields(
      context,
      spacer: _LocalSizedBox(),
    );
  }
}
