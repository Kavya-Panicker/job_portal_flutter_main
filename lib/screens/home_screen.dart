import 'package:flutter/material.dart';
import '../widgets/post_card.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> posts = [
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

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1));
      },
      child: ListView.builder(
        padding: EdgeInsets.only(top: 8),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return PostCard(
            userName: post['userName'],
            userTitle: post['userTitle'],
            userAvatarUrl: post['userAvatarUrl'],
            postContent: post['postContent'],
            postImageUrl: post['postImageUrl'],
            postTime: post['postTime'],
          );
        },
      ),
    );
  }
} 