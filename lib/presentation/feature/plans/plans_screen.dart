import 'package:aqar_go/presentation/feature/plans/plan.dart';
import 'package:aqar_go/presentation/feature/profile/show/profile_cubit.dart';
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
            BlocConsumer<PlansCubit, PlansState>(
              listener: (context, state) {
                if (state.isSuccess) {
                  context.read<ProfileCubit>().fetchProfile();
                }
              },
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

    Color getPremiumOrDefault(Color? fallback) =>
        isPremiumCard
            ? theme.colorScheme.primary
            : (fallback ?? theme.hintColor);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side:
            isCurrentPlan
                ? BorderSide(color: theme.colorScheme.primary, width: 2)
                : BorderSide.none,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header Row (Plan name + Current badge)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  plan.nameId.tr(context),
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: getPremiumOrDefault(null),
                  ),
                ),
                if (isCurrentPlan)
                  _Badge(
                    text: "Current Plan".tr(context),
                    background: theme.colorScheme.primary.withOpacity(0.1),
                    foreground: theme.colorScheme.primary,
                  ),
              ],
            ),
            const SizedBox(height: 8),

            /// Price
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "\$${plan.priceInDollar}",
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: getPremiumOrDefault(null),
                    ),
                  ),
                  TextSpan(
                    text: " /month".tr(context),
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  if (plan.priceInDollar == 0)
                    TextSpan(
                      text: " (Free Forever)".tr(context),
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.secondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            /// Features
            ...plan.features.map(
              (feature) => _FeatureItem(
                iconData: feature.iconData,
                label: feature.nameId.tr(context),
                highlight: isPremiumCard,
              ),
            ),

            const SizedBox(height: 16),

            /// Button
            SizedBox(
              width: double.infinity,
              child: AppButton(
                onPressed:
                    isCurrentPlan
                        ? null
                        : () {
                          if (cubit.state.isPremium) {
                            cubit.downgrade();
                          } else {
                            cubit.upgradeToPremium();
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

/// 🔹 Small badge for "Current Plan"
class _Badge extends StatelessWidget {
  final String text;
  final Color background;
  final Color foreground;

  const _Badge({
    required this.text,
    required this.background,
    required this.foreground,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(color: foreground, fontWeight: FontWeight.w500),
      ),
    );
  }
}

/// 🔹 Reusable feature row
class _FeatureItem extends StatelessWidget {
  final IconData iconData;
  final String label;
  final bool highlight;

  const _FeatureItem({
    required this.iconData,
    required this.label,
    required this.highlight,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color:
                  highlight
                      ? theme.colorScheme.primary.withOpacity(0.1)
                      : theme.colorScheme.surfaceContainerHigh,
              shape: BoxShape.circle,
            ),
            child: Icon(
              iconData,
              size: 16,
              color:
                  highlight
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
