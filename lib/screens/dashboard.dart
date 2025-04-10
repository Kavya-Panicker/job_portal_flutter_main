import 'package:flutter/material.dart';
import '../widgets/post_card.dart';
import '../widgets/notification_card.dart';
import './jobs_screen.dart';
import './chat_screen.dart';
import './profile.dart';
import './home_screen.dart';
import './search_screen.dart';
import './notifications_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> _posts = [];
  List<Map<String, dynamic>> _notifications = [];
  String appBarTitle = "Job Portal";
  late List<Widget> appBarActions;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appBarActions = [
      IconButton(
        icon: Icon(Icons.add_box_outlined, color: Theme.of(context).iconTheme.color),
        onPressed: () => _showCreatePostDialog(context),
      ),
      IconButton(
        icon: Icon(Icons.chat, color: Theme.of(context).iconTheme.color),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
        },
      ),
    ];
  }

  void _initializeData() {
    _posts = [
      {
        'userName': 'John Doe',
        'userTitle': 'Senior Software Engineer at TechCorp',
        'userAvatarUrl': 'https://i.pravatar.cc/150?img=1',
        'postContent': 'Excited to share that I\'ve just completed a major project using Flutter! Looking forward to my next challenge. #Flutter #MobileDevelopment #Tech',
        'postTime': DateTime.now().subtract(Duration(hours: 2)),
      },
      {
        'userName': 'Sarah Smith',
        'userTitle': 'UI/UX Designer',
        'userAvatarUrl': 'https://i.pravatar.cc/150?img=2',
        'postContent': 'Just wrapped up a fascinating workshop on design systems. Here\'s a sneak peek of our latest design project!',
        'postImageUrl': 'https://picsum.photos/seed/picsum/800/400',
        'postTime': DateTime.now().subtract(Duration(hours: 4)),
      },
      {
        'userName': 'Mike Johnson',
        'userTitle': 'Product Manager',
        'userAvatarUrl': 'https://i.pravatar.cc/150?img=3',
        'postContent': 'Our team just launched a new feature that will revolutionize how users interact with our platform. Check it out!',
        'postTime': DateTime.now().subtract(Duration(hours: 5)),
      },
      {
        'userName': 'Emily Chen',
        'userTitle': 'Data Scientist',
        'userAvatarUrl': 'https://i.pravatar.cc/150?img=4',
        'postContent': 'Just published a new research paper on machine learning algorithms. Would love to hear your thoughts!',
        'postImageUrl': 'https://picsum.photos/seed/picsum/800/401',
        'postTime': DateTime.now().subtract(Duration(hours: 6)),
      },
      {
        'userName': 'David Wilson',
        'userTitle': 'DevOps Engineer',
        'userAvatarUrl': 'https://i.pravatar.cc/150?img=5',
        'postContent': 'Successfully migrated our infrastructure to the cloud. Reduced costs by 40%!',
        'postTime': DateTime.now().subtract(Duration(hours: 7)),
      },
      {
        'userName': 'Lisa Brown',
        'userTitle': 'Marketing Director',
        'userAvatarUrl': 'https://i.pravatar.cc/150?img=6',
        'postContent': 'Our latest campaign has reached 1M+ impressions! Thanks to everyone who contributed.',
        'postImageUrl': 'https://picsum.photos/seed/picsum/800/402',
        'postTime': DateTime.now().subtract(Duration(hours: 8)),
      },
      {
        'userName': 'Robert Taylor',
        'userTitle': 'Backend Developer',
        'userAvatarUrl': 'https://i.pravatar.cc/150?img=7',
        'postContent': 'Just optimized our API response time by 60%. The team did an amazing job!',
        'postTime': DateTime.now().subtract(Duration(hours: 9)),
      },
      {
        'userName': 'Jennifer Lee',
        'userTitle': 'Frontend Developer',
        'userAvatarUrl': 'https://i.pravatar.cc/150?img=8',
        'postContent': 'Completed the redesign of our main dashboard. Looking forward to user feedback!',
        'postImageUrl': 'https://picsum.photos/seed/picsum/800/403',
        'postTime': DateTime.now().subtract(Duration(hours: 10)),
      },
      {
        'userName': 'Alex Rodriguez',
        'userTitle': 'QA Engineer',
        'userAvatarUrl': 'https://i.pravatar.cc/150?img=9',
        'postContent': 'Successfully implemented automated testing for our mobile app. Coverage now at 85%!',
        'postTime': DateTime.now().subtract(Duration(hours: 11)),
      },
      {
        'userName': 'Sophia Martinez',
        'userTitle': 'Content Writer',
        'userAvatarUrl': 'https://i.pravatar.cc/150?img=10',
        'postContent': 'Just published our new blog series on tech trends. Check it out and let me know what you think!',
        'postImageUrl': 'https://picsum.photos/seed/picsum/800/404',
        'postTime': DateTime.now().subtract(Duration(hours: 12)),
      },
    ];

    _notifications = [
      {
        'title': 'New Follower',
        'message': 'John Smith started following you',
        'time': DateTime.now().subtract(Duration(minutes: 30)),
        'icon': Icons.person_add,
        'iconColor': Colors.blue,
        'isRead': false,
      },
      {
        'title': 'Post Interaction',
        'message': 'Sarah Wilson liked your post about Flutter development',
        'time': DateTime.now().subtract(Duration(hours: 2)),
        'icon': Icons.thumb_up,
        'iconColor': Colors.green,
        'isRead': false,
      },
      {
        'title': 'New Job Match',
        'message': 'A new job matching your skills has been posted: Senior Flutter Developer',
        'time': DateTime.now().subtract(Duration(hours: 3)),
        'icon': Icons.work,
        'iconColor': Colors.orange,
        'isRead': false,
      },
      {
        'title': 'Connection Request',
        'message': 'Mike Johnson wants to connect with you',
        'time': DateTime.now().subtract(Duration(hours: 4)),
        'icon': Icons.people,
        'iconColor': Colors.purple,
        'isRead': false,
      },
      {
        'title': 'Application Update',
        'message': 'Your application for Frontend Developer at TechCorp has been viewed',
        'time': DateTime.now().subtract(Duration(hours: 5)),
        'icon': Icons.update,
        'iconColor': Colors.teal,
        'isRead': false,
      },
      {
        'title': 'Profile View',
        'message': 'Someone viewed your profile',
        'time': DateTime.now().subtract(Duration(hours: 6)),
        'icon': Icons.remove_red_eye,
        'iconColor': Colors.indigo,
        'isRead': false,
      },
      {
        'title': 'Skill Endorsement',
        'message': 'Emily Chen endorsed your Flutter skills',
        'time': DateTime.now().subtract(Duration(hours: 7)),
        'icon': Icons.star,
        'iconColor': Colors.amber,
        'isRead': false,
      },
      {
        'title': 'Interview Invitation',
        'message': 'You have been invited for an interview at TechCorp',
        'time': DateTime.now().subtract(Duration(hours: 8)),
        'icon': Icons.calendar_today,
        'iconColor': Colors.red,
        'isRead': false,
      },
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          appBarTitle = "Job Portal";
          appBarActions = [
            IconButton(
              icon: Icon(Icons.add_box_outlined, color: Theme.of(context).iconTheme.color),
              onPressed: () => _showCreatePostDialog(context),
            ),
            IconButton(
              icon: Icon(Icons.chat, color: Theme.of(context).iconTheme.color),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
              },
            ),
          ];
          break;
        case 1:
          appBarTitle = "Applications";
          appBarActions = [];
          break;
        case 2:
          appBarTitle = "Search";
          appBarActions = [];
          break;
        case 3:
          appBarTitle = "Notifications";
          appBarActions = [];
          break;
        case 4:
          appBarTitle = "Profile";
          appBarActions = [];
          break;
      }
    });
  }

  Future<void> _refreshFeed() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      for (var post in _posts) {
        post['postTime'] = DateTime.now();
      }
    });
  }

  Future<void> _refreshNotifications() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      for (var notification in _notifications) {
        notification['time'] = DateTime.now();
      }
    });
  }

  Widget _getBody() {
    switch (_selectedIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return JobsScreen();
      case 2:
        return SearchScreen();
      case 3:
        return NotificationsScreen();
      case 4:
        return ProfileScreen();
      default:
        return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        title: Text(
          appBarTitle,
          style: TextStyle(
            color: Theme.of(context).textTheme.titleLarge?.color,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: appBarActions,
        iconTheme: IconThemeData(
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      body: _selectedIndex == 1 || _selectedIndex == 3 
          ? Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: _getBody(),
            )
          : _getBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Applications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).textTheme.bodyMedium?.color,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        elevation: 8,
      ),
    );
  }

  void _applyForJob(String jobTitle) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Applied for $jobTitle successfully!'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showCreatePostDialog(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          String caption = '';
          String taggedPeople = '';
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              leading: IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text('New Post'),
              actions: [
                TextButton(
                  onPressed: () {
                    // Handle post creation here
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Share',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    color: Colors.grey[300],
                    child: Center(
                      child: IconButton(
                        icon: Icon(Icons.add_a_photo, size: 32),
                        onPressed: () {
                          // Add image picker functionality here
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        TextField(
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: 'Write a caption...',
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            caption = value;
                          },
                        ),
                        Divider(),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Tag people',
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.person_add),
                          ),
                          onChanged: (value) {
                            taggedPeople = value;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

