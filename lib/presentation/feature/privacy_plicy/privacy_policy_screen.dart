import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:flutter/material.dart';
import '../../widgets/screen_horizontal_padding.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Privacy Policy".tr(context))),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ScreenPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PrivacyPolicySection(
                  title: "Introduction",
                  body:
                      "At Aqar Go, we value your privacy and are committed to protecting your personal data. This Privacy Policy outlines how we collect, use, and protect your information.",
                ),
                _PrivacyPolicySection(
                  title: "Data Collection",
                  body:
                      "We collect personal data such as your name, email, phone number, and other details when you register or interact with the platform.",
                ),
                _PrivacyPolicySection(
                  title: "Usage of Data",
                  body:
                      "We use your data to improve your experience, communicate with you, and provide personalized recommendations, as well as notifications about posts and promotions.",
                ),
                _PrivacyPolicySection(
                  title: "Third-Party Sharing",
                  body:
                      "We do not sell your personal information to third parties. We may share your data with trusted service providers to help improve our platform, but we ensure that these parties comply with privacy standards.",
                ),
                _PrivacyPolicySection(
                  title: "Your Rights",
                  body:
                      "You have the right to access, update, or delete your personal information at any time. If you have any concerns about your data, please contact us.",
                ),
                _PrivacyPolicySection(
                  title: "Security",
                  body:
                      "We implement industry-standard security measures to protect your personal data. However, no method of data transmission over the internet is 100% secure.",
                ),
                _PrivacyPolicySection(
                  title: "Changes to This Policy",
                  body:
                      "We may update this Privacy Policy from time to time. Any changes will be communicated via notifications or posted on this page.",
                ),
                _PrivacyPolicySection(
                  title: "Contact Us",
                  body:
                      "If you have any questions or concerns about this Privacy Policy or how we handle your personal data, please contact us at support@aqar_go.com.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PrivacyPolicySection extends StatelessWidget {
  final String title;
  final String body;

  const _PrivacyPolicySection({
    required this.title,
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          title.tr(context), // Title in the localized language
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SelectableText(
          body.tr(context), // Body text in the localized language
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
