import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harsha Vardhan Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: const TextTheme(
          displaySmall: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      home: const HomePage(),
      // Web-specific optimizations
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: kIsWeb ? const TextScaler.linear(1.0) : MediaQuery.of(context).textScaler,
          ),
          child: child!,
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  static final _projectsKey = GlobalKey();
  static final _aboutKey = GlobalKey();
  static final _skillsKey = GlobalKey();
  static final _contactKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top navigation bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () => scrollTo(_projectsKey),
                    child: const Text('Projects')),
                const SizedBox(width: 16),
                TextButton(
                    onPressed: () => scrollTo(_aboutKey),
                    child: const Text('About')),
                const SizedBox(width: 16),
                TextButton(
                    onPressed: () => scrollTo(_skillsKey),
                    child: const Text('Skills')),
                const SizedBox(width: 16),
                TextButton(
                    onPressed: () => scrollTo(_contactKey),
                    child: const Text('Contact')),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Hero with avatar
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 32),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text('Nidadavolu Harsha Vardhan Raju',
                            style: Theme.of(context).textTheme.displaySmall),
                        const SizedBox(height: 8),
                        const Text(
                          'CSE Undergraduate | Passionate about Software Development & Innovation',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        const CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.grey,
                          child: Icon(
                            Icons.person,
                            size: 80,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Projects (no project image, only text card)
                  Container(
                    key: _projectsKey,
                    padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Projects',
                            style: Theme.of(context).textTheme.headlineSmall),
                        const SizedBox(height: 24),
                        const _TextOnlyProjectCard(
                          title: 'Testing of Hypothesis',
                          desc:
                              'Contributed to hypothesis testing using statistical tools (t-test, z-test). Focused on null & alternative hypotheses, and data-driven decision making.',
                        ),
                      ],
                    ),
                  ),

                  // About
                  Container(
                    key: _aboutKey,
                    padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('About',
                            style: Theme.of(context).textTheme.headlineSmall),
                        const SizedBox(height: 16),
                        const Text(
                          'Motivated and enthusiastic Computer Science and Engineering undergraduate currently pursuing a B.Tech at CR Rao AIMSCS College.\n'
                          'Passionate about technology, software development, and continuous learning. Strong interest in innovation and emerging trends.',
                        ),
                      ],
                    ),
                  ),

                  // Skills
                  Container(
                    key: _skillsKey,
                    padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Skills',
                            style: Theme.of(context).textTheme.headlineSmall),
                        const SizedBox(height: 16),
                        const Text('• Python\n• MySQL\n• HTML\n• MS Excel'),
                      ],
                    ),
                  ),

                  // Contact
                  Container(
                    key: _contactKey,
                    padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Contact',
                            style: Theme.of(context).textTheme.headlineSmall),
                        const SizedBox(height: 16),
                        const Text('Phone: +91 70138 28223'),
                        const Text('Email: harshavardhan.270305@gmail.com'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Simple text-only project card (no image)
class _TextOnlyProjectCard extends StatelessWidget {
  final String title;
  final String desc;

  const _TextOnlyProjectCard({
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(desc),
          ],
        ),
      ),
    );
  }
}
