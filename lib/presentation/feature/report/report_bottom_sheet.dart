import 'package:aqar_go/domain/model/report/report_reason.dart';
import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/helper/ui_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/widgets/app_button.dart';
import 'package:aqar_go/presentation/widgets/app_text_field.dart';
import 'package:aqar_go/presentation/widgets/screen_horizontal_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'cubit/report_cubit.dart';

class ReportBottomSheet extends StatelessWidget {
  const ReportBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReportCubit>();
    return BlocConsumer<ReportCubit, ReportState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
          error: (error) {
            context.showMyAlertDialogFromDomainError(error);
          },
          success: () {
            context.showMyAlertDialog(
              "Done".tr(context),
              ["Your report has been sent successfully!".tr(context)],
              false,
              onGotItClicked: () {
                context.popRoute();
              },
            );
          },
        );
      },
      builder: (context, state) {
        return BottomSheet(
          showDragHandle: false,
          enableDrag: false,
          onClosing: () {
            context.pop();
          },
          builder: (context) {
            return SingleChildScrollView(
              child: ScreenPadding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      "Tell us what went wrong!".tr(context),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Specify a reason for reporting this ad.".tr(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    ...ReportReason.values.map(
                      (reason) => _ReportReason(
                        reason: reason,
                        selectedReason: state.selectedReason,
                        onSelected: (reason) {
                          context.read<ReportCubit>().selectReason(reason);
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (state.selectedReason == ReportReason.other) ...[
                      AppTextField(
                        labelText: "Please specify".tr(context),
                        textEditingController: cubit.otherReasonController,
                      ),
                      const SizedBox(height: 16),
                    ],
                    const SizedBox(height: 8),
                    AppButton(
                      onPressed:
                          (state.selectedReason != null)
                              ? () {
                                context.read<ReportCubit>().submitReport();
                              }
                              : null,
                      text: "Submit".tr(context),
                      isLoading: state.isLoading(),
                    ),
                    SizedBox(height: 280),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _ReportReason extends StatelessWidget {
  final ReportReason reason;
  final ReportReason? selectedReason;
  final Function(ReportReason reason) onSelected;

  const _ReportReason({
    required this.reason,
    this.selectedReason,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<ReportReason>(
          value: reason,
          groupValue: selectedReason,
          onChanged: (value) {
            context.read<ReportCubit>().selectReason(reason);
          },
        ),
        Text(reason.name.tr(context)),
      ],
    );
  }
}
