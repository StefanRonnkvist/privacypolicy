import 'package:flutter/material.dart';

/// Displays the complete privacy policy as a centered list of sections.
class PrivacyTab extends StatelessWidget {
  const PrivacyTab({super.key});

  /// Policy content kept separately from layout so each section is rendered
  /// consistently by [_PrivacySectionRow].
  static const sections = <PrivacySection>[
    PrivacySection(
      title: 'Information Collection',
      description:
          'This website may collect information that you provide directly, '
          'such as your name, email address, and the contents of messages you '
          'send through a contact form.',
    ),
    PrivacySection(
      title: 'How Information Is Used',
      description:
          'Information you provide is used to respond to inquiries, maintain '
          'the website, and improve its content and functionality.',
    ),
    PrivacySection(
      title: 'Information Sharing',
      description:
          'Personal information is not sold or rented. It may be disclosed '
          'when required by law or when necessary to protect the website and '
          'its users.',
    ),
    PrivacySection(
      title: 'Third-Party Services',
      description:
          'This website may link to or use third-party services. Their privacy '
          'practices are governed by their own policies.',
    ),
    PrivacySection(
      title: 'Warranty Disclaimer',
      description:
          'The website and its content are provided as is, without warranties '
          'of any kind. Availability, accuracy, and fitness for a particular '
          'purpose are not guaranteed.',
    ),
    PrivacySection(
      title: 'Policy Changes',
      description:
          'This policy may be updated periodically. Any changes will be shown '
          'on this page with a revised effective date.',
    ),
  ];

  /// Builds a width-constrained policy panel from [sections].
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 780),
        padding: const EdgeInsets.all(36),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAF8),
          border: Border.all(color: const Color(0xFFD7DED9)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy and Warranty for StefanRonnkvist.com',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontFamily: 'Georgia',
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Effective Date: 04/23/2026',
              style: TextStyle(color: Color(0xFF5F6B63), fontSize: 13),
            ),
            const SizedBox(height: 28),
            for (final section in sections) ...[
              _PrivacySectionRow(section: section),
              const SizedBox(height: 22),
            ],
          ],
        ),
      ),
    );
  }
}

/// Immutable content for one titled section of the privacy policy.
class PrivacySection {
  const PrivacySection({required this.title, required this.description});

  final String title;
  final String description;
}

/// Renders a single policy heading and its explanatory text.
class _PrivacySectionRow extends StatelessWidget {
  const _PrivacySectionRow({required this.section});

  final PrivacySection section;

  /// Builds the heading and body for [section].
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          section.title,
          style: const TextStyle(
            color: Color(0xFF17211B),
            fontFamily: 'Georgia',
            fontWeight: FontWeight.w600,
            fontSize: 19,
          ),
        ),
        const SizedBox(height: 8),
        Text(section.description),
      ],
    );
  }
}
