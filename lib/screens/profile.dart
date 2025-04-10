import 'package:flutter/material.dart';
import './edit_profile.dart';
import './settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic> userProfile = {
    'name': 'John Doe',
    'username': '@johndoe',
    'headline': 'Senior Flutter Developer',
    'location': 'Ahmedabad, India',
    'bio': 'Flutter Developer | Tech Enthusiast | Coffee Lover\nBuilding amazing mobile apps one widget at a time',
    'profileImage': 'https://i.pravatar.cc/150?img=1',
    'coverImage': 'https://picsum.photos/800/200',
    'posts': 42,
    'followers': 1200,
    'following': 350,
    'skills': ['Flutter', 'Dart', 'Android', 'iOS', 'Firebase'],
    'experience': [
      {
        'title': 'Senior Flutter Developer',
        'company': 'TechCorp',
        'duration': '2021 - Present',
        'description': 'Leading mobile app development team, implementing new features and maintaining existing applications.'
      },
      {
        'title': 'Mobile Developer',
        'company': 'Digital Solutions',
        'duration': '2019 - 2021',
        'description': 'Developed and maintained multiple mobile applications using Flutter and React Native.'
      }
    ],
    'education': [
      {
        'degree': 'Bachelor of Technology',
        'field': 'Computer Science',
        'school': 'Tech University',
        'year': '2015 - 2019'
      }
    ]
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: isDark ? Colors.black : Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: isDark ? Colors.white : Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover Image and Profile Section
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(userProfile['coverImage']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -60,
                  left: 16,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: theme.scaffoldBackgroundColor,
                        width: 4,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(userProfile['profileImage']),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 70),
            
            // Profile Info Section
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userProfile['name'],
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: theme.textTheme.titleLarge?.color,
                              ),
                            ),
                            Text(
                              userProfile['headline'],
                              style: TextStyle(
                                fontSize: 16,
                                color: theme.textTheme.bodyMedium?.color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final updatedProfile = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfileScreen(),
                            ),
                          );
                          if (updatedProfile != null) {
                            setState(() {
                              userProfile = updatedProfile;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text('Edit Profile'),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: theme.iconTheme.color),
                      SizedBox(width: 4),
                      Text(
                        userProfile['location'],
                        style: TextStyle(color: theme.textTheme.bodyMedium?.color),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  
                  // Stats Section
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: theme.dividerColor),
                        bottom: BorderSide(color: theme.dividerColor),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatColumn('Posts', userProfile['posts'], theme),
                        _buildStatColumn('Followers', userProfile['followers'], theme),
                        _buildStatColumn('Following', userProfile['following'], theme),
                      ],
                    ),
                  ),
                  
                  // About Section
                  SizedBox(height: 24),
                  Text(
                    'About',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.titleLarge?.color,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    userProfile['bio'],
                    style: TextStyle(
                      color: theme.textTheme.bodyMedium?.color,
                      height: 1.5,
                    ),
                  ),
                  
                  // Skills Section
                  SizedBox(height: 24),
                  Text(
                    'Skills',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.titleLarge?.color,
                    ),
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: userProfile['skills'].map<Widget>((skill) => Chip(
                      label: Text(skill),
                      backgroundColor: theme.cardColor,
                      side: BorderSide(color: theme.dividerColor),
                    )).toList(),
                  ),
                  
                  // Experience Section
                  SizedBox(height: 24),
                  Text(
                    'Experience',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.titleLarge?.color,
                    ),
                  ),
                  SizedBox(height: 8),
                  ...userProfile['experience'].map((exp) => Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exp['title'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: theme.textTheme.titleLarge?.color,
                          ),
                        ),
                        Text(
                          exp['company'],
                          style: TextStyle(
                            color: theme.textTheme.bodyMedium?.color,
                          ),
                        ),
                        Text(
                          exp['duration'],
                          style: TextStyle(
                            color: theme.textTheme.bodyMedium?.color,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          exp['description'],
                          style: TextStyle(
                            color: theme.textTheme.bodyMedium?.color,
                          ),
                        ),
                      ],
                    ),
                  )).toList(),
                  
                  // Education Section
                  SizedBox(height: 24),
                  Text(
                    'Education',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.titleLarge?.color,
                    ),
                  ),
                  SizedBox(height: 8),
                  ...userProfile['education'].map((edu) => Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          edu['degree'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: theme.textTheme.titleLarge?.color,
                          ),
                        ),
                        Text(
                          edu['field'],
                          style: TextStyle(
                            color: theme.textTheme.bodyMedium?.color,
                          ),
                        ),
                        Text(
                          '${edu['school']} • ${edu['year']}',
                          style: TextStyle(
                            color: theme.textTheme.bodyMedium?.color,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  )).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String label, int count, ThemeData theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: theme.textTheme.titleLarge?.color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: theme.textTheme.bodyMedium?.color,
          ),
        ),
      ],
    );
  }
}
