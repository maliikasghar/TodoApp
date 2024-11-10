import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: [
              // 1st Page
              OnboardingPage(
                image: 'assets/image1.png', // Replace with your image path
                title: "Welcome to the App",
                description: "Discover new features and possibilities.",
              ),
              // 2nd Page
              OnboardingPage(
                image: 'assets/image2.png', // Replace with your image path
                title: "Connect with Friends",
                description: "Stay connected with everyone you know.",
              ),
              // 3rd Page
              OnboardingPage(
                image: 'assets/image3.png', // Replace with your image path
                title: "Get Started",
                description: "Join us and start your journey.",
              ),
            ],
          ),
          Positioned(
            bottom: 30.0,
            right: 16.0,
            child: _currentPage == 2
                ? FloatingActionButton.extended(
              onPressed: () {
                // Navigate to Registration or Login Page
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Get Started'),
                      content: Text('Choose an option to continue.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Navigate to Registration page
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text('Register'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigate to Login page
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text('Login'),
                        ),
                      ],
                    );
                  },
                );
              },
              label: Text('Get Started'),
              icon: Icon(Icons.arrow_forward),
            )
                : Container(),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 250.0,
        ),
        SizedBox(height: 20.0),
        Text(
          title,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            description,
            style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
