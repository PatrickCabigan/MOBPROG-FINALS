// John Patrick Cabigan // MOBPROG: IT242 // FinalProject // Property ni patrickk
import 'package:flutter/material.dart';

void main() {
  runApp(FinalProjectApp());
}

const String APP_TITLE = 'Pat the patatas profile!';
const Color BRIGHT_YELLOW = Color(0xFFFBC02D);
const Color PALE_YELLOW = Color(0xFFFFFDE7);
const Color ACCENT_ORANGE = Color(0xFFE65100);
const Color BACKGROUND_CREAM = Color(0xFFFFFBE6);

class FinalProjectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: BACKGROUND_CREAM,
      ),
      home: ProfileHomeScreen(),
    );
  }
}

class ProfileHomeScreen extends StatefulWidget {
  @override
  _ProfileHomeScreenState createState() => _ProfileHomeScreenState();
}

class _ProfileHomeScreenState extends State<ProfileHomeScreen> {
  // Edit profile feature added. (START)
  // State variables for profile information
  String profileName = 'John Patrick Cabigan';
  String profileSection = 'Section IT242 • Silly Energetic Human';
  String profileBio =
      "I'm a 5'10 ft tall that was born in Donsol, Sorsogon, a manga collector, and an airplane enthusiast who loves commercial airliners. I enjoy bonding with friends, exploring new places, and learning creative digital hobbies such as photo editing and art design.";
  // Edit profile feature added. (END)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          APP_TITLE,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: BRIGHT_YELLOW,
        centerTitle: true,
        elevation: 0,
        actions: [
          // Edit profile feature added. (START)
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.black),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfileScreen(
                    currentName: profileName,
                    currentSection: profileSection,
                    currentBio: profileBio,
                  ),
                ),
              );

              if (result != null) {
                setState(() {
                  profileName = result['name'];
                  profileSection = result['section'];
                  profileBio = result['bio'];
                });
              }
            },
          ),
          // Edit profile feature added. (END)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: BRIGHT_YELLOW,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                children: [
                  HoverWidget(
                    child: const CircleAvatar(
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
                  const SizedBox(height: 20),
                  Text(
                    profileName,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    profileSection,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      profileBio,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14, height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Wrap(
                  spacing: 25,
                  runSpacing: 25,
                  alignment: WrapAlignment.center,
                  children: [
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
                            _buildHistoryItem(
                              'SVNHS',
                              'Junior & Senior High',
                              'https://raw.githubusercontent.com/PatrickCabigan/WEBPROG-IT242-HTML-LESSONS/refs/heads/feature/2_JPC_customize_my_website/svnhs-removebg-preview.png',
                            ),
                          ],
                        ),
                      ),
                    ),
                    HoverWidget(
                      child: _buildInfoCard(
                        title: 'Interests & Hobbies',
                        child: Column(
                          children: [
                            _buildInterestTile(
                              Icons.airplanemode_active,
                              'Collections:',
                              'Airplane models and Manga series',
                            ),
                            _buildInterestTile(
                              Icons.movie,
                              'Creativity:',
                              'Cinema movies, Art Design, Photo Editing',
                            ),
                            _buildInterestTile(
                              Icons.favorite,
                              'Social:',
                              'Hanging out with friends',
                            ),
                          ],
                        ),
                      ),
                    ),
                    HoverWidget(
                      child: _buildInfoCard(
                        title: 'IT Experiences',
                        child: const Text(
                          'Python (Game Development), Java, OutSystems, HTML, GitHub',
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ),
                    ),
                    HoverWidget(
                      child: _buildInfoCard(
                        title: 'Location & Contact',
                        child: Column(
                          children: [
                            _buildContactItem(
                              Icons.location_on,
                              'Taguig City',
                              Colors.pinkAccent,
                            ),
                            _buildContactItem(
                              Icons.email,
                              'jgcabigan@student.apc.edu.ph',
                              Colors.blueAccent,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60),
            const Text(
              'Top 5 Favorite Anime',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: ACCENT_ORANGE,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 30,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: [
                  _buildAnimePoster(
                    'Violet Evergarden',
                    'https://raw.githubusercontent.com/PatrickCabigan/WEBPROG-IT242-HTML-LESSONS/feature/2_JPC_customize_my_website/violet.jpg',
                  ),
                  _buildAnimePoster(
                    'A Galaxy Next Door',
                    'https://raw.githubusercontent.com/PatrickCabigan/WEBPROG-IT242-HTML-LESSONS/feature/2_JPC_customize_my_website/galaxy.jpg',
                  ),
                  _buildAnimePoster(
                    'Fragrant Flower',
                    'https://raw.githubusercontent.com/PatrickCabigan/WEBPROG-IT242-HTML-LESSONS/feature/2_JPC_customize_my_website/waguri.jpg',
                  ),
                  _buildAnimePoster(
                    'Kimi no Todoke',
                    'https://raw.githubusercontent.com/PatrickCabigan/WEBPROG-IT242-HTML-LESSONS/feature/2_JPC_customize_my_website/sawako.jpg',
                  ),
                  _buildAnimePoster(
                    'The Wind Rises',
                    'https://raw.githubusercontent.com/PatrickCabigan/WEBPROG-IT242-HTML-LESSONS/feature/2_JPC_customize_my_website/wind%20rises.jpg',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({required String title, required Widget child}) {
    return Container(
      width: 460,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: const Border(top: BorderSide(color: BRIGHT_YELLOW, width: 8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFB8860B),
            ),
          ),
          const SizedBox(height: 10),
          const Divider(color: Colors.black12),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  Widget _buildAnimePoster(String title, String url) {
    return HoverWidget(
      child: Container(
        width: 190,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                url,
                height: 260,
                width: 170,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.broken_image,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryItem(String school, String level, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Image.network(
            imageUrl,
            width: 40,
            height: 40,
            errorBuilder: (c, e, s) =>
                const Icon(Icons.school, size: 30, color: ACCENT_ORANGE),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                school,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                level,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInterestTile(IconData icon, String label, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: ACCENT_ORANGE),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 14, color: Colors.black),
                children: [
                  TextSpan(
                    text: label,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ' $text',
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 18, color: iconColor),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

// Edit profile feature added. (start)
class EditProfileScreen extends StatefulWidget {
  final String currentName;
  final String currentSection;
  final String currentBio;

  const EditProfileScreen({
    required this.currentName,
    required this.currentSection,
    required this.currentBio,
  });

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _sectionController;
  late TextEditingController _bioController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName);
    _sectionController = TextEditingController(text: widget.currentSection);
    _bioController = TextEditingController(text: widget.currentBio);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: BRIGHT_YELLOW,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your name' : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _sectionController,
                decoration: const InputDecoration(
                  labelText: 'Section/Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your section' : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _bioController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Bio',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a bio' : null,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ACCENT_ORANGE,
                  padding: const EdgeInsets.all(15),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, {
                      'name': _nameController.text,
                      'section': _sectionController.text,
                      'bio': _bioController.text,
                    });
                  }
                },
                child: const Text(
                  'Save Changes',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Edit profile feature added. (end)

class HoverWidget extends StatefulWidget {
  final Widget child;
  const HoverWidget({super.key, required this.child});
  @override
  _HoverWidgetState createState() => _HoverWidgetState();
}

class _HoverWidgetState extends State<HoverWidget> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => isHovered = true),
      onExit: (event) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        transform: Matrix4.identity()..translate(0, isHovered ? -15 : 0),
        child: widget.child,
      ),
    );
  }
}
