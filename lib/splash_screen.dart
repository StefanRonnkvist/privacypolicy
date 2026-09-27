import 'package:flutter/material.dart';
import 'package:privacypolicy/help_tab.dart';
import 'package:privacypolicy/privacypolicy.dart';

const _ink = Color(0xFF07110E);
const _accent = Color(0xFF43D19E);
const _highlight = Color(0xFF7EF0C2);

/// Hosts the privacy policy and supporting help content.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? 'Privacy Policy' : 'Help'),
        backgroundColor: const Color(0xFFF8FAF8),
        foregroundColor: _ink,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: const [
            SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: PrivacyTab(),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: HelpTab(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.policy_outlined),
            selectedIcon: Icon(Icons.policy),
            label: 'Policy',
          ),
          NavigationDestination(
            icon: Icon(Icons.help_outline),
            selectedIcon: Icon(Icons.help),
            label: 'Help',
          ),
        ],
      ),
    );
  }
}

/// Presents the animated brand screen before opening [HomeScreen].
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  /// Creates the state that owns the splash animations and navigation timer.
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // One controller keeps all splash effects and route timing synchronized.
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.92,
      end: 1,
    ).chain(CurveTween(curve: Curves.easeOutCubic)).animate(_controller);

    _pulseAnimation = Tween<double>(begin: 1, end: 1.08)
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.25, 1, curve: Curves.easeInOut),
          ),
        );

    _controller.forward();
    // Navigation uses the same duration as the controller so the animation
    // completes before the policy replaces the splash route.
    Future<void>.delayed(const Duration(seconds: 3), _openHomeScreen);
  }

  /// Replaces the splash route once its animation has completed.
  void _openHomeScreen() {
    // The delayed callback may run after disposal if the app closes early.
    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (_) => const HomeScreen()),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Builds the layered background, animated logo, title, and progress bar.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0F1A17), _ink],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 160,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: _accent.withValues(alpha: 0.25),
                        blurRadius: 80,
                        spreadRadius: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ScaleTransition(
                        scale: _pulseAnimation,
                        child: Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(36),
                            boxShadow: [
                              BoxShadow(
                                color: _accent.withValues(alpha: 0.28),
                                blurRadius: 22,
                                spreadRadius: 6,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(36),
                            child: Image.asset(
                              'assets/privacypolicy.png',
                              width: 160,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Privacy Policy',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.6,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Loading...',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.3,
                        ),
                      ),
                      const SizedBox(height: 22),
                      const SizedBox(
                        width: 180,
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.white24,
                          valueColor: AlwaysStoppedAnimation<Color>(_highlight),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
