// John Patrick Cabigan // MOBPROG: IT242 // FinalProject // Property ni patrickk
import 'package:flutter/material.dart';

void main() {
  runApp(FinalProjectApp());
}

const String APP_TITLE = 'Pat the patatas profile!';
const Color BRIGHT_YELLOW = Color(0xFFFBC02D);
const Color PALE_YELLOW = Color(0xFFFFFDE7);
const Color ACCENT_ORANGE = Color(0xFFE65100);

class FinalProjectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ProfileHomeScreen(),
    );
  }
}

class ProfileHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          APP_TITLE,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: BRIGHT_YELLOW,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              width: double.infinity,
              color: BRIGHT_YELLOW,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                children: [
                  // Hoverable Profile Picture
                  HoverWidget(
                    child: CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                          'https://raw.githubusercontent.com/PatrickCabigan/WEBPROG-IT242-HTML-LESSONS/refs/heads/feature/2_JPC_customize_my_website/adg.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'John Patrick Cabigan',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Section IT242 • Silly Energetic Human',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "I'm a 5'10 ft tall that was born in Donsol, Sorsogon, a manga collector, and an airplane enthusiast who loves commercial airliners. I enjoy bonding with friends, exploring new places, and learning creative digital hobbies such as photo editing and art design.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),

            // Academic History (Hoverable)
            HoverWidget(
              child: _buildInfoCard(
                title: 'Academic History',
                child: Column(
                  children: [
                    _buildHistoryItem(
                      'FTJCA',
                      'Elementary',
                      'https://raw.githubusercontent.com/PatrickCabigan/WEBPROG-IT242-HTML-LESSONS/refs/heads/feature/2_JPC_customize_my_website/ftjca-removebg-preview.png',
                    ),
                    Divider(),
                    _buildHistoryItem(
                      'SVNHS',
                      'Junior & Senior High',
                      'https://raw.githubusercontent.com/PatrickCabigan/WEBPROG-IT242-HTML-LESSONS/refs/heads/feature/2_JPC_customize_my_website/svnhs-removebg-preview.png',
                    ),
                  ],
                ),
              ),
            ),

            // Interests & Hobbies (Hoverable)
            HoverWidget(
              child: _buildInfoCard(
                title: 'Interests & Hobbies',
                child: Column(
                  children: [
                    _buildInterestTile(
                      Icons.menu_book,
                      'Collections',
                      'Airplane models and Manga series',
                    ),
                    _buildInterestTile(
                      Icons.brush,
                      'Creativity',
                      'Cinema movies, Art Design, Photo & Video Editing',
                    ),
                    _buildInterestTile(
                      Icons.groups,
                      'Social',
                      'Hanging out with friends and Travelling',
                    ),
                  ],
                ),
              ),
            ),

            // Experiences (Hoverable)
            HoverWidget(
              child: _buildInfoCard(
                title: 'IT Experiences & Location',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '• Python (Game Development), Java, OutSystems, HTML, GitHub',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: ACCENT_ORANGE),
                        SizedBox(width: 5),
                        Text(
                          'Taguig City',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Card UI
  Widget _buildInfoCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: PALE_YELLOW,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: BRIGHT_YELLOW, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ACCENT_ORANGE,
            ),
          ),
          SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  // ListTile UI
  Widget _buildHistoryItem(String school, String level, String imageUrl) {
    return ListTile(
      leading: Image.network(
        imageUrl,
        width: 40,
        height: 40,
        errorBuilder: (c, e, s) => Icon(Icons.school),
      ),
      title: Text(school, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(level),
    );
  }

  // Row UI
  Widget _buildInterestTile(IconData icon, String category, String details) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: ACCENT_ORANGE),
          SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 14),
                children: [
                  TextSpan(
                    text: '$category: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: details),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Hover Effect Widget
class HoverWidget extends StatefulWidget {
  final Widget child;
  HoverWidget({required this.child});

  @override
  _HoverWidgetState createState() => _HoverWidgetState();
}

class _HoverWidgetState extends State<HoverWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    // MouseRegion
    return MouseRegion(
      onEnter: (event) => setState(() => isHovered = true),
      onExit: (event) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        // Floating effect: move up by 10 pixels on hover
        transform: Matrix4.identity()..translate(0, isHovered ? -10 : 0),
        child: widget.child,
      ),
    );
  }
}
