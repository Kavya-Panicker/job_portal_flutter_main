import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _headlineController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  final TextEditingController _educationController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();

  String? _selectedJobType;
  String? _selectedExperience;
  String? _selectedEducation;
  List<String> _skills = [];
  String? _profileImage;

  final List<String> _jobTypes = [
    'Full-time',
    'Part-time',
    'Contract',
    'Freelance',
    'Internship',
  ];

  final List<String> _experienceLevels = [
    'Entry Level',
    'Mid Level',
    'Senior Level',
    'Executive',
  ];

  final List<String> _educationLevels = [
    'High School',
    'Bachelor\'s Degree',
    'Master\'s Degree',
    'PhD',
    'Other',
  ];

  @override
  void initState() {
    super.initState();
    // Initialize with sample data
    _nameController.text = 'John Doe';
    _headlineController.text = 'Senior Flutter Developer';
    _bioController.text = 'Experienced mobile developer with 5+ years of experience in Flutter and native Android development.';
    _locationController.text = 'Ahmedabad, India';
    _skills = ['Flutter', 'Dart', 'Android', 'iOS', 'Firebase'];
    _selectedJobType = 'Full-time';
    _selectedExperience = 'Senior Level';
    _selectedEducation = 'Bachelor\'s Degree';
    _profileImage = 'https://i.pravatar.cc/150?img=1';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveProfile,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(_profileImage!),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              _buildTextField('Full Name', _nameController),
              _buildTextField('Professional Headline', _headlineController),
              _buildTextField('Bio', _bioController, maxLines: 3),
              _buildTextField('Location', _locationController),
              
              SizedBox(height: 16),
              Text(
                'Skills',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _skills.map((skill) => Chip(
                  label: Text(skill),
                  onDeleted: () {
                    setState(() {
                      _skills.remove(skill);
                    });
                  },
                )).toList(),
              ),
              TextField(
                controller: _skillsController,
                decoration: InputDecoration(
                  hintText: 'Add new skill',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      if (_skillsController.text.isNotEmpty) {
                        setState(() {
                          _skills.add(_skillsController.text);
                          _skillsController.clear();
                        });
                      }
                    },
                  ),
                ),
              ),

              SizedBox(height: 16),
              _buildDropdown('Preferred Job Type', _selectedJobType, _jobTypes, (value) {
                setState(() {
                  _selectedJobType = value;
                });
              }),

              SizedBox(height: 16),
              _buildDropdown('Experience Level', _selectedExperience, _experienceLevels, (value) {
                setState(() {
                  _selectedExperience = value;
                });
              }),

              SizedBox(height: 16),
              _buildDropdown('Education Level', _selectedEducation, _educationLevels, (value) {
                setState(() {
                  _selectedEducation = value;
                });
              }),

              SizedBox(height: 16),
              Text(
                'Education',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              _buildTextField('Education Details', _educationController, maxLines: 3),

              SizedBox(height: 16),
              Text(
                'Work Experience',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              _buildTextField('Experience Details', _experienceController, maxLines: 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {int maxLines = 1}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        maxLines: maxLines,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdown(String label, String? value, List<String> items, Function(String?) onChanged) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select $label';
          }
          return null;
        },
      ),
    );
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement profile saving logic
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile updated successfully!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _headlineController.dispose();
    _bioController.dispose();
    _locationController.dispose();
    _skillsController.dispose();
    _educationController.dispose();
    _experienceController.dispose();
    super.dispose();
  }
} 