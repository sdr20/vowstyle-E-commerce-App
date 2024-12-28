import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class StartDesigningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Start Designing Your Wedding Dress',
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
            DesignOptionsSection(),
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
              'Design Your Dream Wedding Dress',
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Customize every detail from fabric to fit and embellishments!',
              style: GoogleFonts.poppins(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class DesignOptionsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DesignOptionCard(
            title: 'Choose Fabric',
            description: 'Pick the fabric that fits your style.',
            onTap: () {
              // Placeholder function for choosing fabric
              print('Navigate to fabric selection');
            },
          ),
          DesignOptionCard(
            title: 'Select Design Features',
            description: 'Choose the style, cut, and fit for your dress.',
            onTap: () {
              // Placeholder function for selecting design features
              print('Navigate to design features selection');
            },
          ),
          DesignOptionCard(
            title: 'Add Embellishments',
            description: 'Decorate your dress with lace, beads, and more.',
            onTap: () {
              // Placeholder function for adding embellishments
              print('Navigate to embellishments selection');
            },
          ),
        ],
      ),
    );
  }
}

class DesignOptionCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const DesignOptionCard({
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: Icon(Icons.design_services, color: Colors.pink),
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
            'Contact Us',
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
