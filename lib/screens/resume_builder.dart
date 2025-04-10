import 'package:flutter/material.dart';

class ResumeBuilderScreen extends StatefulWidget {
  final Map<String, dynamic>? initialData;

  const ResumeBuilderScreen({Key? key, this.initialData}) : super(key: key);

  @override
  _ResumeBuilderScreenState createState() => _ResumeBuilderScreenState();
}

class _ResumeBuilderScreenState extends State<ResumeBuilderScreen> {
  final _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> _personalInfo;
  late List<Map<String, dynamic>> _education;
  late List<Map<String, dynamic>> _experience;
  late List<String> _skills;
  late List<String> _languages;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    if (widget.initialData != null) {
      _personalInfo = Map<String, dynamic>.from(widget.initialData!['personalInfo'] ?? {});
      _education = List<Map<String, dynamic>>.from(widget.initialData!['education'] ?? []);
      _experience = List<Map<String, dynamic>>.from(widget.initialData!['experience'] ?? []);
      _skills = List<String>.from(widget.initialData!['skills'] ?? []);
      _languages = List<String>.from(widget.initialData!['languages'] ?? []);
    } else {
      _personalInfo = {
        'fullName': '',
        'email': '',
        'phone': '',
        'address': '',
        'linkedin': '',
        'github': '',
      };
      _education = [];
      _experience = [];
      _skills = [];
      _languages = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Resume Builder',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: isDark ? Colors.black : Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.save, color: isDark ? Colors.white : Colors.black),
            onPressed: _saveResume,
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
              _buildSectionTitle('Personal Information'),
              _buildPersonalInfoForm(theme),
              SizedBox(height: 24),
              
              _buildSectionTitle('Education'),
              _buildEducationList(theme),
              _buildAddButton('Add Education', _addEducation),
              SizedBox(height: 24),
              
              _buildSectionTitle('Work Experience'),
              _buildExperienceList(theme),
              _buildAddButton('Add Experience', _addExperience),
              SizedBox(height: 24),
              
              _buildSectionTitle('Skills'),
              _buildSkillsList(theme),
              _buildAddButton('Add Skill', _addSkill),
              SizedBox(height: 24),
              
              _buildSectionTitle('Languages'),
              _buildLanguagesList(theme),
              _buildAddButton('Add Language', _addLanguage),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildPersonalInfoForm(ThemeData theme) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Full Name',
            border: OutlineInputBorder(),
          ),
          onSaved: (value) => _personalInfo['fullName'] = value ?? '',
        ),
        SizedBox(height: 16),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.emailAddress,
          onSaved: (value) => _personalInfo['email'] = value ?? '',
        ),
        SizedBox(height: 16),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Phone',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.phone,
          onSaved: (value) => _personalInfo['phone'] = value ?? '',
        ),
        SizedBox(height: 16),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Address',
            border: OutlineInputBorder(),
          ),
          onSaved: (value) => _personalInfo['address'] = value ?? '',
        ),
        SizedBox(height: 16),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'LinkedIn Profile',
            border: OutlineInputBorder(),
          ),
          onSaved: (value) => _personalInfo['linkedin'] = value ?? '',
        ),
        SizedBox(height: 16),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'GitHub Profile',
            border: OutlineInputBorder(),
          ),
          onSaved: (value) => _personalInfo['github'] = value ?? '',
        ),
      ],
    );
  }

  Widget _buildEducationList(ThemeData theme) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _education.length,
      itemBuilder: (context, index) {
        final edu = _education[index];
        return Card(
          margin: EdgeInsets.only(bottom: 8),
          child: ListTile(
            title: Text(edu['degree'] ?? ''),
            subtitle: Text('${edu['school']} • ${edu['year']}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _removeEducation(index),
            ),
          ),
        );
      },
    );
  }

  Widget _buildExperienceList(ThemeData theme) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _experience.length,
      itemBuilder: (context, index) {
        final exp = _experience[index];
        return Card(
          margin: EdgeInsets.only(bottom: 8),
          child: ListTile(
            title: Text(exp['title'] ?? ''),
            subtitle: Text('${exp['company']} • ${exp['duration']}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _removeExperience(index),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSkillsList(ThemeData theme) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _skills.map((skill) => Chip(
        label: Text(skill),
        onDeleted: () => _removeSkill(skill),
      )).toList(),
    );
  }

  Widget _buildLanguagesList(ThemeData theme) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _languages.map((lang) => Chip(
        label: Text(lang),
        onDeleted: () => _removeLanguage(lang),
      )).toList(),
    );
  }

  Widget _buildAddButton(String label, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(Icons.add),
        label: Text(label),
      ),
    );
  }

  void _addEducation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Education'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Degree'),
              onChanged: (value) => _education.add({'degree': value}),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'School'),
              onChanged: (value) => _education.last['school'] = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Year'),
              onChanged: (value) => _education.last['year'] = value,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {});
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  void _addExperience() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Experience'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Job Title'),
              onChanged: (value) => _experience.add({'title': value}),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Company'),
              onChanged: (value) => _experience.last['company'] = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Duration'),
              onChanged: (value) => _experience.last['duration'] = value,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {});
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  void _addSkill() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Skill'),
        content: TextField(
          decoration: InputDecoration(labelText: 'Skill'),
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              setState(() => _skills.add(value));
              Navigator.pop(context);
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _addLanguage() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Language'),
        content: TextField(
          decoration: InputDecoration(labelText: 'Language'),
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              setState(() => _languages.add(value));
              Navigator.pop(context);
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _removeEducation(int index) {
    setState(() => _education.removeAt(index));
  }

  void _removeExperience(int index) {
    setState(() => _experience.removeAt(index));
  }

  void _removeSkill(String skill) {
    setState(() => _skills.remove(skill));
  }

  void _removeLanguage(String lang) {
    setState(() => _languages.remove(lang));
  }

  void _saveResume() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final resumeData = {
        'personalInfo': _personalInfo,
        'education': _education,
        'experience': _experience,
        'skills': _skills,
        'languages': _languages,
      };
      Navigator.pop(context, resumeData);
    }
  }
}

class ResumeViewScreen extends StatelessWidget {
  final Map<String, dynamic> resumeData;

  const ResumeViewScreen({Key? key, required this.resumeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final personalInfo = resumeData['personalInfo'];
    final education = resumeData['education'];
    final experience = resumeData['experience'];
    final skills = resumeData['skills'];
    final languages = resumeData['languages'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Resume',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: isDark ? Colors.black : Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: isDark ? Colors.white : Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResumeBuilderScreen(initialData: resumeData),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Center(
              child: Column(
                children: [
                  Text(
                    personalInfo['fullName'],
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.titleLarge?.color,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    personalInfo['email'],
                    style: TextStyle(
                      fontSize: 16,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                  Text(
                    personalInfo['phone'],
                    style: TextStyle(
                      fontSize: 16,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                  Text(
                    personalInfo['address'],
                    style: TextStyle(
                      fontSize: 16,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            
            // Education
            _buildSectionTitle('Education'),
            ...education.map((edu) => Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    edu['degree'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.titleLarge?.color,
                    ),
                  ),
                  Text(
                    edu['school'],
                    style: TextStyle(
                      fontSize: 16,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                  Text(
                    edu['year'],
                    style: TextStyle(
                      fontSize: 14,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                ],
              ),
            )).toList(),
            
            // Experience
            _buildSectionTitle('Work Experience'),
            ...experience.map((exp) => Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exp['title'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.titleLarge?.color,
                    ),
                  ),
                  Text(
                    exp['company'],
                    style: TextStyle(
                      fontSize: 16,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                  Text(
                    exp['duration'],
                    style: TextStyle(
                      fontSize: 14,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                ],
              ),
            )).toList(),
            
            // Skills
            _buildSectionTitle('Skills'),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: skills.map((skill) => Chip(
                label: Text(skill),
                backgroundColor: theme.cardColor,
                side: BorderSide(color: theme.dividerColor),
              )).toList(),
            ),
            
            // Languages
            _buildSectionTitle('Languages'),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: languages.map((lang) => Chip(
                label: Text(lang),
                backgroundColor: theme.cardColor,
                side: BorderSide(color: theme.dividerColor),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
} 