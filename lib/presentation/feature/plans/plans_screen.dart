import 'package:aqar_go/presentation/feature/plans/plan.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/widgets/app_button.dart';
import 'package:aqar_go/presentation/widgets/error_message.dart';
import 'package:aqar_go/presentation/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/plans_cubit.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Choose Your Plan".tr(context))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Select the plan that's right for you".tr(context),
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            BlocBuilder<PlansCubit, PlansState>(
              builder: (context, state) {
                final widget = state.when(
                  initial: (isPremium) => null,
                  loading: (isPremium) => LoadingScreen(),
                  error:
                      (isPremium, error) =>
                          ErrorMessage(error: error, onTryAgain: () {}),
                  success: (isPremium) => null,
                );
                return widget ??
                    Column(
                      children: [
                        ...List.generate(PlansCubit.plans.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: _PlanWidget(
                              plan: PlansCubit.plans[index],
                              isCurrentPlan: index == (state.isPremium ? 1 : 0),
                            ),
                          );
                        }),
                      ],
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _PlanWidget extends StatelessWidget {
  final Plan plan;
  final bool isCurrentPlan;

  const _PlanWidget({required this.plan, required this.isCurrentPlan});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<PlansCubit>();
    final isPremiumCard = plan.isPremium;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side:
            isCurrentPlan
                ? BorderSide(color: theme.primaryColor, width: 2)
                : BorderSide.none,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  plan.nameId.tr(context),
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isPremiumCard ? theme.primaryColor : null,
                  ),
                ),
                if (isCurrentPlan)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "Current Plan".tr(context),
                      style: TextStyle(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "\$${plan.priceInDollar}",
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isPremiumCard ? theme.primaryColor : null,
                    ),
                  ),
                  TextSpan(
                    text: " /month".tr(context),
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  if (plan.priceInDollar == 0)
                    TextSpan(
                      text: " (Free Forever)".tr(context),
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ...plan.features.map(
              (feature) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color:
                            isPremiumCard
                                ? theme.primaryColor.withOpacity(0.1)
                                : Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        feature.iconData,
                        size: 16,
                        color:
                            isPremiumCard
                                ? theme.primaryColor
                                : Colors.grey[600],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        feature.nameId.tr(context),
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: AppButton(
                onPressed:
                    isCurrentPlan
                        ? null
                        : () {
                          if (cubit.state.isPremium) {
                            cubit.goFree();
                          } else {
                            cubit.goPremium();
                          }
                        },
                text: (isCurrentPlan ? "Current Plan" : "Get Started").tr(
                  context,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
