import 'package:flutter/material.dart';

/// Explains the app's purpose and how to read the included policy.
class HelpTab extends StatelessWidget {
  const HelpTab({super.key});

  static const _sections = <({IconData icon, String title, String body})>[
    (
      icon: Icons.menu_book_outlined,
      title: 'What this app contains',
      body:
          'This app presents the privacy policy and warranty information for '
          'StefanRonnkvist.com in a focused, readable format.',
    ),
    (
      icon: Icons.touch_app_outlined,
      title: 'Using the app',
      body:
          'Choose Policy in the navigation bar to read the document. Scroll '
          'to review every section, including information use, sharing, '
          'third-party services, and the warranty disclaimer.',
    ),
    (
      icon: Icons.public_outlined,
      title: 'Policy scope',
      body:
          'The policy describes StefanRonnkvist.com. Links or services '
          'provided by third parties are governed by their own privacy '
          'policies and terms.',
    ),
    (
      icon: Icons.update_outlined,
      title: 'Policy updates',
      body:
          'Check the effective date at the top of the Policy tab. Updated '
          'versions of the app may include revisions to the policy text.',
    ),
    (
      icon: Icons.lock_outline,
      title: 'Access',
      body:
          'No account or sign-in is required. The policy and help text are '
          'bundled with the installed app.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 780),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About this app',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontFamily: 'Georgia',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'A quick guide to the policy viewer and the document it shows.',
              style: TextStyle(color: Color(0xFF5F6B63)),
            ),
            const SizedBox(height: 28),
            for (final section in _sections) ...[
              _HelpSection(
                icon: section.icon,
                title: section.title,
                body: section.body,
              ),
              const Divider(height: 32),
            ],
          ],
        ),
      ),
    );
  }
}

class _HelpSection extends StatelessWidget {
  const _HelpSection({
    required this.icon,
    required this.title,
    required this.body,
  });

  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFF167A5A), size: 24),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              Text(body),
            ],
          ),
        ),
      ],
    );
  }
}
