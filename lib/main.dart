import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      title: 'Expenses category',
      description: 'Category make it easier to track and monitor your spending',
      illustration: const ExpensesCategoryIllustration(),
    ),
    OnboardingData(
      title: 'Financial monitoring',
      description: 'Keep your incomes and expenses on track',
      illustration: const FinancialMonitoringIllustration(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return OnboardingPage(data: _pages[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pages.length,
                          (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentPage == index ? 12 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? const Color(0xFF2196F3)
                              : const Color(0xFFE0E0E0),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentPage < _pages.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          // Navigate to main app
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2196F3),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'GET STARTED',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      // Handle restore data
                    },
                    child: const Text(
                      'RESTORE DATA',
                      style: TextStyle(
                        color: Color(0xFF2196F3),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String description;
  final Widget illustration;

  OnboardingData({
    required this.title,
    required this.description,
    required this.illustration,
  });
}

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;

  const OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          data.illustration,
          const SizedBox(height: 60),
          Text(
            data.title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF212121),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            data.description,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF757575),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class ExpensesCategoryIllustration extends StatelessWidget {
  const ExpensesCategoryIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Decorative elements
          Positioned(
            top: 50,
            left: 40,
            child: _DecorativeIcon(color: Colors.blue.shade300),
          ),
          Positioned(
            top: 30,
            right: 60,
            child: _DecorativeIcon(color: Colors.orange.shade300),
          ),
          Positioned(
            bottom: 80,
            left: 30,
            child: _DecorativeIcon(color: Colors.red.shade300),
          ),
          Positioned(
            right: 40,
            top: 120,
            child: _DecorativeIcon(color: Colors.yellow.shade600),
          ),
          Positioned(
            right: 50,
            bottom: 100,
            child: _DecorativeIcon(color: Colors.teal.shade300),
          ),
          Positioned(
            left: 60,
            bottom: 120,
            child: _DecorativeIcon(color: Colors.orange.shade200),
          ),
          // Main document card
          Container(
            width: 220,
            height: 280,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 3),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Pie chart
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CustomPaint(
                      painter: PieChartPainter(),
                    ),
                  ),
                  // Lines
                  Column(
                    children: [
                      Container(
                        height: 3,
                        width: 120,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 3,
                        width: 120,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  // Line chart
                  SizedBox(
                    height: 80,
                    child: CustomPaint(
                      painter: LineChartPainter(),
                      size: const Size(180, 80),
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

class FinancialMonitoringIllustration extends StatelessWidget {
  const FinancialMonitoringIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Decorative elements
          Positioned(
            top: 60,
            left: 50,
            child: _DecorativeIcon(color: Colors.yellow.shade600),
          ),
          Positioned(
            top: 40,
            right: 80,
            child: _DecorativeIcon(color: Colors.blue.shade300),
          ),
          Positioned(
            bottom: 100,
            left: 40,
            child: _DecorativeIcon(color: Colors.teal.shade300),
          ),
          Positioned(
            right: 60,
            bottom: 120,
            child: _DecorativeIcon(color: Colors.orange.shade200),
          ),
          // Main illustration
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // List document
              Container(
                width: 140,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black, width: 3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ListItem(color: Colors.teal),
                      const SizedBox(height: 8),
                      _ListItem(color: Colors.yellow),
                      const SizedBox(height: 8),
                      _ListItem(color: Colors.red),
                      const SizedBox(height: 8),
                      _ListItem(color: Colors.blue),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 4,
                            height: 30,
                            color: Colors.teal,
                          ),
                          const SizedBox(width: 4),
                          Container(
                            width: 4,
                            height: 20,
                            color: Colors.yellow,
                          ),
                          const SizedBox(width: 4),
                          Container(
                            width: 4,
                            height: 25,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 4),
                          Container(
                            width: 4,
                            height: 35,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Credit card
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_upward, color: Colors.teal, size: 32),
                  Icon(Icons.arrow_downward, color: Colors.red, size: 32),
                  const SizedBox(height: 8),
                  Container(
                    width: 120,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 20,
                                height: 16,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Container(
                                  height: 3,
                                  color: Colors.blue.shade200,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.7),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Transform.translate(
                                offset: const Offset(-8, 0),
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: Colors.orange.withOpacity(0.7),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DecorativeIcon extends StatelessWidget {
  final Color color;

  const _DecorativeIcon({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: color.withOpacity(0.6),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.close,
        size: 12,
        color: color,
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final Color color;

  const _ListItem({required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            height: 3,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class PieChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paint1 = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;

    final paint2 = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final paint3 = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.5,
      1.8,
      true,
      paint1,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0.3,
      1.2,
      true,
      paint2,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      1.5,
      3.0,
      true,
      paint3,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class LineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final pointPaint = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.fill;

    final points = [
      Offset(20, size.height - 20),
      Offset(50, size.height - 35),
      Offset(80, size.height - 50),
      Offset(110, size.height - 30),
    ];

    final path = Path()..moveTo(points[0].dx, points[0].dy);

    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }

    canvas.drawPath(path, linePaint);

    for (final point in points) {
      canvas.drawCircle(point, 5, pointPaint);
    }

    // Bar chart
    final barPaint1 = Paint()..color = Colors.blue.shade200;
    final barPaint2 = Paint()..color = Colors.orange.shade300;
    final barPaint3 = Paint()..color = Colors.red.shade300;

    canvas.drawRect(Rect.fromLTWH(130, size.height - 25, 10, 25), barPaint1);
    canvas.drawRect(Rect.fromLTWH(145, size.height - 35, 10, 35), barPaint2);
    canvas.drawRect(Rect.fromLTWH(160, size.height - 40, 10, 40), barPaint3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}