import 'dart:io';

import 'package:aqar_go/common/helpers/logging_helper.dart';
import 'package:aqar_go/common/helpers/ui_helper.dart';
import 'package:aqar_go/domain/model/media_file.dart';
import 'package:aqar_go/presentation/feature/media_picker/media_picker_cubit.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ImagePickerWidget extends StatelessWidget {
  final String titleId;

  const ImagePickerWidget({super.key, this.titleId = "Media files"});

  @override
  Widget build(BuildContext context) {
    return FormField<List<MediaFile>>(
      initialValue: context.read<MediaPickerCubit>().state.files,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Images are required!";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (field) {
        final titleWidget =
        (field.hasError)
            ? Text(
          "${titleId.tr(context)} *",
          style: Theme
              .of(context)
              .textTheme
              .titleLarge
              ?.copyWith(
            color: Theme
                .of(context)
                .colorScheme
                .error,
          ),
        )
            : Text(
          titleId.tr(context),
          style: Theme
              .of(context)
              .textTheme
              .titleLarge,
        );

        return BlocConsumer<MediaPickerCubit, MediaPickerState>(
          listenWhen: (previous, current) => previous.files != current.files,
          listener: (context, state) {
            debugLog("images = $state");
            field.didChange(state.files);
          },
          builder: (context, state) {
            final files = state.files;

            final rowCount = ((files.length + 1) / 3).ceil();
            debugLog("rowCount: $rowCount");

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleWidget,
                SizedBox(
                  height: rowCount * 120,
                  child: GridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ...files.map((file) {
                        return ClickableCard(
                          onTap: () {
                            context.showMyAlertDialog(
                              "Remove Image?".tr(context),
                              [
                                "Are you sure you want to remove this image?"
                                    .tr(context),
                              ],
                              true,
                              gotItPlaceholder: "Remove".tr(context),
                              onGotItClicked: () {
                                context.read<MediaPickerCubit>().removeImage(
                                  file,
                                );
                              },
                              firstAction: TextButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: Text("Cancel"),
                              ),
                            );
                          },
                          child: _FileImage(file: file),
                        );
                      }),
                      if (files.length < 10)
                        ClickableCard(
                          onTap: () {
                            context.read<MediaPickerCubit>().pickImage();
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Center(
                              child: Icon(
                                Icons.add,
                                size: 50,
                                color: Theme
                                    .of(context)
                                    .iconTheme
                                    .color,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class ClickableCard extends StatelessWidget {
  final Function() onTap;
  final Widget child;

  const ClickableCard({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(10);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: BorderSide(color: Theme
            .of(context)
            .dividerColor, width: 0.5),
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: InkWell(borderRadius: borderRadius, onTap: onTap, child: child),
      ),
    );
  }
}

class _FileImage extends StatelessWidget {
  final MediaFile file;

  const _FileImage({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    if (file.path != null) {
      return Image.file(File(file.path!), fit: BoxFit.cover);
    }
    if (file.imageUrl !=null) {
      return Image.network(file.imageUrl!, fit: BoxFit.cover);
    }
    return Image.asset(
      "assets/images/profile_image_placeholder.png",
      fit: BoxFit.cover,
    );
  }
}
