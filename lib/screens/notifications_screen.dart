import 'package:flutter/material.dart';
import '../widgets/notification_card.dart';

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Application Update',
      'message': 'Your application for Senior Flutter Developer at TechCorp has been viewed',
      'time': DateTime.now().subtract(Duration(minutes: 30)),
      'icon': Icons.work,
      'iconColor': Colors.blue,
      'isRead': false,
    },
    {
      'title': 'Profile View',
      'message': 'HR Manager from Digital Innovations viewed your profile',
      'time': DateTime.now().subtract(Duration(hours: 1)),
      'icon': Icons.visibility,
      'iconColor': Colors.purple,
      'isRead': false,
    },
    {
      'title': 'Job Match',
      'message': 'New job matching your skills: Mobile App Developer at InnoTech',
      'time': DateTime.now().subtract(Duration(hours: 2)),
      'icon': Icons.work_outline,
      'iconColor': Colors.green,
      'isRead': false,
    },
    {
      'title': 'Application Status',
      'message': 'You have been shortlisted for Frontend Developer position',
      'time': DateTime.now().subtract(Duration(hours: 3)),
      'icon': Icons.check_circle,
      'iconColor': Colors.green,
      'isRead': true,
    },
    {
      'title': 'Interview Schedule',
      'message': 'Your interview with TechSolutions is scheduled for tomorrow at 2 PM',
      'time': DateTime.now().subtract(Duration(hours: 4)),
      'icon': Icons.calendar_today,
      'iconColor': Colors.orange,
      'isRead': false,
    },
    {
      'title': 'Profile Strength',
      'message': 'Add your recent projects to improve profile visibility',
      'time': DateTime.now().subtract(Duration(hours: 5)),
      'icon': Icons.trending_up,
      'iconColor': Colors.blue,
      'isRead': true,
    },
    {
      'title': 'New Connection',
      'message': 'Sarah Smith, UI/UX Designer, wants to connect',
      'time': DateTime.now().subtract(Duration(hours: 6)),
      'icon': Icons.person_add,
      'iconColor': Colors.purple,
      'isRead': true,
    },
    {
      'title': 'Job Application Deadline',
      'message': 'Only 2 days left to apply for Senior Developer position',
      'time': DateTime.now().subtract(Duration(hours: 7)),
      'icon': Icons.timer,
      'iconColor': Colors.red,
      'isRead': true,
    },
    {
      'title': 'Skill Endorsement',
      'message': 'John Doe endorsed you for Flutter Development',
      'time': DateTime.now().subtract(Duration(hours: 8)),
      'icon': Icons.thumb_up,
      'iconColor': Colors.green,
      'isRead': true,
    },
    {
      'title': 'Company Update',
      'message': 'TechCorp has posted 3 new positions matching your profile',
      'time': DateTime.now().subtract(Duration(hours: 9)),
      'icon': Icons.business,
      'iconColor': Colors.blue,
      'isRead': true,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // Add refresh logic here
        await Future.delayed(Duration(seconds: 1));
      },
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Notifications',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.titleLarge?.color,
              ),
            ),
          ),
          ...notifications.map((notification) => NotificationCard(
            title: notification['title'],
            message: notification['message'],
            time: notification['time'],
            icon: notification['icon'],
            iconColor: notification['iconColor'],
            isRead: notification['isRead'],
          )).toList(),
        ],
      ),
    );
  }
} 