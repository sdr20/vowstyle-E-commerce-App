import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PremiumFabricsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Premium Fabrics',
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

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.pink[50],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Explore Premium Fabrics',
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Choose from a variety of luxurious fabrics for your perfect wedding dress',
              style: GoogleFonts.poppins(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
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
            title: 'Silk',
            description: 'Soft, elegant, and luxurious fabric.',
            image: 'assets/images/silk_fabric.jpg', // Replace with actual image path
          ),
          FeatureCard(
            title: 'Satin',
            description: 'Smooth, shiny fabric perfect for formal dresses.',
            image: 'assets/images/satin_fabric.jpg', // Replace with actual image path
          ),
          FeatureCard(
            title: 'Lace',
            description: 'Delicate and intricate, ideal for bridal gowns.',
            image: 'assets/images/lace_fabric.jpg', // Replace with actual image path
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const FeatureCard({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Image.asset(
          image,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
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
                icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
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
