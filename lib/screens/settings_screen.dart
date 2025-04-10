import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _emailNotifications = true;
  bool _pushNotifications = true;
  bool _jobAlerts = true;
  String _selectedLanguage = 'English';
  String _selectedPrivacy = 'Public';

  final List<String> _languages = ['English', 'Hindi', 'Gujarati', 'Malayalam'];
  final List<String> _privacyOptions = ['Public', 'Connections Only', 'Private'];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          _buildSectionHeader('Account Settings'),
          _buildListTile(
            'Edit Profile',
            Icons.person,
            onTap: () {
              Navigator.pop(context); // Go back to profile
              Navigator.pushNamed(context, '/edit_profile');
            },
          ),
          _buildListTile(
            'Privacy Settings',
            Icons.lock,
            onTap: () {
              _showPrivacyDialog();
            },
          ),
          _buildListTile(
            'Change Password',
            Icons.security,
            onTap: () {
              // TODO: Implement change password
            },
          ),
          _buildListTile(
            'Delete Account',
            Icons.delete,
            onTap: () {
              _showDeleteAccountDialog();
            },
          ),

          _buildSectionHeader('Job Preferences'),
          _buildListTile(
            'Job Alerts',
            Icons.notifications,
            trailing: Switch(
              value: _jobAlerts,
              onChanged: (value) {
                setState(() {
                  _jobAlerts = value;
                });
              },
            ),
          ),
          _buildListTile(
            'Preferred Job Types',
            Icons.work,
            onTap: () {
              _showJobTypesDialog();
            },
          ),
          _buildListTile(
            'Preferred Locations',
            Icons.location_on,
            onTap: () {
              _showLocationsDialog();
            },
          ),
          _buildListTile(
            'Salary Range',
            Icons.attach_money,
            onTap: () {
              _showSalaryRangeDialog();
            },
          ),

          _buildSectionHeader('Notifications'),
          _buildListTile(
            'Email Notifications',
            Icons.email,
            trailing: Switch(
              value: _emailNotifications,
              onChanged: (value) {
                setState(() {
                  _emailNotifications = value;
                });
              },
            ),
          ),
          _buildListTile(
            'Push Notifications',
            Icons.notifications,
            trailing: Switch(
              value: _pushNotifications,
              onChanged: (value) {
                setState(() {
                  _pushNotifications = value;
                });
              },
            ),
          ),

          _buildSectionHeader('App Settings'),
          _buildListTile(
            'Language',
            Icons.language,
            trailing: Text(_selectedLanguage),
            onTap: () {
              _showLanguageDialog();
            },
          ),
          _buildListTile(
            'Dark Mode',
            Icons.dark_mode,
            trailing: Switch(
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
            ),
          ),
          _buildListTile(
            'Help & Support',
            Icons.help,
            onTap: () {
              // TODO: Implement help & support
            },
          ),
          _buildListTile(
            'About',
            Icons.info,
            onTap: () {
              _showAboutDialog();
            },
          ),

          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                // Save settings
                Navigator.pop(context);
              },
              child: Text('Save Changes'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildListTile(String title, IconData icon, {Widget? trailing, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: trailing,
      onTap: onTap,
    );
  }

  void _showPrivacyDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Privacy Settings'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: _privacyOptions.map((option) => RadioListTile(
            title: Text(option),
            value: option,
            groupValue: _selectedPrivacy,
            onChanged: (value) {
              setState(() {
                _selectedPrivacy = value.toString();
              });
              Navigator.pop(context);
            },
          )).toList(),
        ),
      ),
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: _languages.map((language) => RadioListTile(
            title: Text(language),
            value: language,
            groupValue: _selectedLanguage,
            onChanged: (value) {
              setState(() {
                _selectedLanguage = value.toString();
              });
              Navigator.pop(context);
            },
          )).toList(),
        ),
      ),
    );
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Account'),
        content: Text('Are you sure you want to delete your account? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // TODO: Implement account deletion
              Navigator.pop(context);
            },
            child: Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showJobTypesDialog() {
    // TODO: Implement job types selection
  }

  void _showLocationsDialog() {
    // TODO: Implement locations selection
  }

  void _showSalaryRangeDialog() {
    // TODO: Implement salary range selection
  }

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('About Job Portal'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Version: 1.0.0'),
            SizedBox(height: 8),
            Text('Job Portal is a platform for job seekers and employers to connect.'),
            SizedBox(height: 8),
            Text('© 2024 Job Portal. All rights reserved.'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
} 