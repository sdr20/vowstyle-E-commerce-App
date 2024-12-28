import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'start_designing_screen.dart'; 

class CustomDesignScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Custom Design",
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
  
  final List<String> imageUrls = [
    'assets/images/f5.webp', 
    'assets/images/f2.webp',
    'assets/images/f9.webp',
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
   
    Future.delayed(Duration(seconds: 3), _autoChangeImage);
  }

  void _autoChangeImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % imageUrls.length;
    });
    Future.delayed(Duration(seconds: 3), _autoChangeImage);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        AnimatedSwitcher(
          duration: Duration(seconds: 1),
          child: Image.asset(
            imageUrls[_currentIndex],
            key: ValueKey<int>(_currentIndex),
            fit: BoxFit.cover,
            height: 300,
            width: double.infinity,
          ),
        ),
       
        Container(
          height: 300,
          color: Colors.black.withOpacity(0.5), 
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Design Your Dream Wedding Dress',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white, 
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Work with our designers to bring your vision to life',
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StartDesigningScreen()), 
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                  ),
                  child: Text('Start Designing'),
                ),
              ],
            ),
          ),
        ),
      ],
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
            title: 'Personalized Designs',
            description: 'Create a dress that reflects your style',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StartDesigningScreen()), 
              );
            },
          ),
          FeatureCard(
            icon: Icons.star,
            title: 'Expert Guidance',
            description: 'Get advice from top bridal designers',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StartDesigningScreen()), 
              );
            },
          ),
          FeatureCard(
            icon: Icons.palette,
            title: 'Fabric Selection',
            description: 'Choose from a wide range of fabrics',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StartDesigningScreen()), 
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
                icon: FaIcon(FontAwesomeIcons.pinterest, color: Colors.white), 
                onPressed: () {},
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.white),
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
