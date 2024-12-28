import 'dart:async'; // Import for Timer
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import for FontAwesome icons

// Import your custom screens here
import 'custom_design_screen.dart';
import 'expert_tailoring_screen.dart';
import 'premium_fabrics_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "VowStyle",
          style: GoogleFonts.playfairDisplay(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HeroSection(),
            FeaturesSection(),
            GallerySection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

class HeroSection extends StatefulWidget {
  @override
  _HeroSectionState createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  final List<String> images = [
    'assets/images/batlag.jpg',
    'assets/images/f1.jpeg',
    'assets/images/f2.webp',
    'assets/images/f3.webp',
  ];

  late PageController _pageController;
  late Timer _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startSlideshow();
  }

  @override
  void dispose() {
    _timer.cancel(); // Make sure to cancel the timer to prevent memory leaks
    super.dispose();
  }

  void _startSlideshow() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % images.length;
        _pageController.animateToPage(
          _currentIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          // PageView for image slideshow
          PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.asset(
                images[index],
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
              );
            },
          ),
          // Overlay content on top of the images
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Design Your Perfect Wedding Dress',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Create the dress of your dreams with our expert designers',
                    style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the CustomDesignScreen when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CustomDesignScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                    ),
                    child: Text('Good to see you!'),
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

class FeaturesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FeatureCard(
            icon: Icons.brush,
            title: 'Custom Design',
            description: 'Create your unique style',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomDesignScreen()), // Updated navigation
              );
            },
          ),
          FeatureCard(
            icon: Icons.cut,
            title: 'Expert Tailoring',
            description: 'Perfect fit guaranteed',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExpertTailoringScreen()), // Updated navigation
              );
            },
          ),
          FeatureCard(
            icon: Icons.star,
            title: 'Premium Fabrics',
            description: 'Finest materials only',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PremiumFabricsScreen()), // Updated navigation
              );
            },
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: Icon(icon, color: Colors.pink),
          title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          subtitle: Text(description),
        ),
      ),
    );
  }
}

class GallerySection extends StatelessWidget {
  final List<String> galleryImages = [
    'assets/images/batlag.jpg',
    'assets/images/f1.jpeg',
    'assets/images/f2.webp',
    'assets/images/f3.webp',
    // Add more images here
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured Designs',
            style: Theme.of(context).textTheme.titleLarge, // Updated
          ),
          SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: galleryImages.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(galleryImages[index]),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Contact',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text('Email: hello@vowstyle.com', style: TextStyle(color: Colors.white)),
          Text('Phone: (555) 123-4567', style: TextStyle(color: Colors.white)),
          SizedBox(height: 10),
          Text(
            'Follow Us',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.facebook, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.pinterest, color: Colors.white), // FontAwesome
                onPressed: () {},
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.white), // FontAwesome
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            '© 2024 VowStyle. All rights reserved.',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
