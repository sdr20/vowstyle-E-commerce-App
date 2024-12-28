import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import for FontAwesome icons

class ExpertTailoringScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Expert Tailoring",
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
  late PageController _pageController;
  int _currentIndex = 0;
  final List<String> _images = [
    'assets/images/experttailoring1.jpg',
    'assets/images/experttailoring2.jpg',
    'assets/images/experttailoring3.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startImageSlider();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  void _startImageSlider() {
    Future.delayed(Duration(seconds: 3), () {
      if (_currentIndex < _images.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }

      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );


      _startImageSlider();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [

          PageView.builder(
            controller: _pageController,
            itemCount: _images.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(_images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                      'Perfect Fit Guaranteed',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white,  
                      ),
                      textAlign: TextAlign.center,
                    ),

                SizedBox(height: 10),
                Text(
                  'Our expert tailors ensure a dress that fits you perfectly!',
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                  
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
          
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExpertTailoringScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                  ),
                  child: Text('Start Tailoring'),
                ),
              ],
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
            title: 'Expert Designers',
            description: 'Our team of designers ensures your vision is perfectly executed.',
            onTap: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExpertTailoringScreen()),
              );
            },
          ),
          FeatureCard(
            icon: Icons.check_circle, 
            title: 'Precise Measurements',
            description: 'We take detailed measurements to create the perfect fit for you.',
            onTap: () {
              // Navigate to detailed tailoring process
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExpertTailoringScreen()),
              );
            },
          ),
          FeatureCard(
            icon: Icons.thumb_up, 
            title: 'Satisfaction Guaranteed',
            description: 'If you’re not satisfied, we’ll work with you until it’s perfect.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExpertTailoringScreen()),
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
    'assets/images/experttailoring1.jpg',
    'assets/images/experttailoring2.jpg',
    'assets/images/experttailoring3.jpg',
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
            'Tailoring Gallery',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 10),
          Container(
            height: 300,
            child: PageView.builder(
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
          ),
          SizedBox(height: 10),
          Text(
            '1 / ${galleryImages.length}',
            style: TextStyle(color: Colors.grey),
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
            'Contact Us',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text('Email: support@vowstyle.com', style: TextStyle(color: Colors.white)),
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
