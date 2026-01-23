// Edit profile feature added. (START)
  // State variables for profile information
  String profileName = 'John Patrick Cabigan';
  String profileSection = 'Section IT242 • Silly Energetic Human';
  String profileBio =
      "I'm a 5'10 ft tall that was born in Donsol, Sorsogon, a manga collector, and an airplane enthusiast who loves commercial airliners. I enjoy bonding with friends, exploring new places, and learning creative digital hobbies such as photo editing and art design.";
  // Edit profile feature added. (END)



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