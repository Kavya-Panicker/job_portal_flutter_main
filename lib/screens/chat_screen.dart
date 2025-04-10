import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> _chats = [
    {
      'id': '1',
      'name': 'Sarah Johnson',
      'avatar': 'https://i.pravatar.cc/150?img=1',
      'lastMessage': 'Hey, I saw your post about the Flutter project!',
      'time': '10:30 AM',
      'unread': 2,
      'messages': [
        {'sender': 'them', 'text': 'Hi there!', 'time': '10:00 AM'},
        {'sender': 'me', 'text': 'Hello! How are you?', 'time': '10:05 AM'},
        {'sender': 'them', 'text': 'I\'m good, thanks! I saw your post about the Flutter project!', 'time': '10:30 AM'},
      ],
    },
    {
      'id': '2',
      'name': 'Michael Chen',
      'avatar': 'https://i.pravatar.cc/150?img=2',
      'lastMessage': 'Can we discuss the project requirements?',
      'time': 'Yesterday',
      'unread': 0,
      'messages': [
        {'sender': 'them', 'text': 'Hi, I\'m interested in your services', 'time': 'Yesterday, 3:45 PM'},
        {'sender': 'me', 'text': 'Sure, what can I help you with?', 'time': 'Yesterday, 3:50 PM'},
        {'sender': 'them', 'text': 'Can we discuss the project requirements?', 'time': 'Yesterday, 4:00 PM'},
      ],
    },
    {
      'id': '3',
      'name': 'Emma Wilson',
      'avatar': 'https://i.pravatar.cc/150?img=3',
      'lastMessage': 'Thanks for the help with the code!',
      'time': '2 days ago',
      'unread': 0,
      'messages': [
        {'sender': 'them', 'text': 'I\'m stuck with this Flutter issue', 'time': '2 days ago, 11:00 AM'},
        {'sender': 'me', 'text': 'What\'s the problem?', 'time': '2 days ago, 11:05 AM'},
        {'sender': 'them', 'text': 'Thanks for the help with the code!', 'time': '2 days ago, 12:00 PM'},
      ],
    },
    {
      'id': '4',
      'name': 'David Kim',
      'avatar': 'https://i.pravatar.cc/150?img=4',
      'lastMessage': 'The meeting is scheduled for tomorrow',
      'time': '3 days ago',
      'unread': 1,
      'messages': [
        {'sender': 'them', 'text': 'Let\'s schedule a meeting', 'time': '3 days ago, 2:00 PM'},
        {'sender': 'me', 'text': 'Sure, when works for you?', 'time': '3 days ago, 2:05 PM'},
        {'sender': 'them', 'text': 'The meeting is scheduled for tomorrow', 'time': '3 days ago, 2:30 PM'},
      ],
    },
    {
      'id': '5',
      'name': 'Lisa Patel',
      'avatar': 'https://i.pravatar.cc/150?img=5',
      'lastMessage': 'I\'ve sent you the project files',
      'time': '4 days ago',
      'unread': 0,
      'messages': [
        {'sender': 'them', 'text': 'I need to share some files with you', 'time': '4 days ago, 9:00 AM'},
        {'sender': 'me', 'text': 'Okay, you can send them here', 'time': '4 days ago, 9:05 AM'},
        {'sender': 'them', 'text': 'I\'ve sent you the project files', 'time': '4 days ago, 9:30 AM'},
      ],
    },
    {
      'id': '6',
      'name': 'Robert Taylor',
      'avatar': 'https://i.pravatar.cc/150?img=6',
      'lastMessage': 'Let me know if you need any help',
      'time': '5 days ago',
      'unread': 0,
      'messages': [
        {'sender': 'them', 'text': 'I saw your profile, impressive work!', 'time': '5 days ago, 1:00 PM'},
        {'sender': 'me', 'text': 'Thank you!', 'time': '5 days ago, 1:05 PM'},
        {'sender': 'them', 'text': 'Let me know if you need any help', 'time': '5 days ago, 1:30 PM'},
      ],
    },
    {
      'id': '7',
      'name': 'Sophia Lee',
      'avatar': 'https://i.pravatar.cc/150?img=7',
      'lastMessage': 'The design looks great!',
      'time': '1 week ago',
      'unread': 0,
      'messages': [
        {'sender': 'them', 'text': 'I need your opinion on this design', 'time': '1 week ago, 10:00 AM'},
        {'sender': 'me', 'text': 'Sure, send it over', 'time': '1 week ago, 10:05 AM'},
        {'sender': 'them', 'text': 'The design looks great!', 'time': '1 week ago, 10:30 AM'},
      ],
    },
    {
      'id': '8',
      'name': 'James Wilson',
      'avatar': 'https://i.pravatar.cc/150?img=8',
      'lastMessage': 'Looking forward to working with you',
      'time': '2 weeks ago',
      'unread': 0,
      'messages': [
        {'sender': 'them', 'text': 'I have a new project opportunity', 'time': '2 weeks ago, 3:00 PM'},
        {'sender': 'me', 'text': 'Sounds interesting, tell me more', 'time': '2 weeks ago, 3:05 PM'},
        {'sender': 'them', 'text': 'Looking forward to working with you', 'time': '2 weeks ago, 3:30 PM'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Messages',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: isDark ? Colors.black : Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: isDark ? Colors.white : Colors.black),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _chats.length,
        itemBuilder: (context, index) {
          final chat = _chats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(chat['avatar']),
            ),
            title: Text(
              chat['name'],
              style: TextStyle(
                fontWeight: chat['unread'] > 0 ? FontWeight.bold : FontWeight.normal,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            subtitle: Text(
              chat['lastMessage'],
              style: TextStyle(
                color: isDark ? Colors.grey[400] : Colors.grey[600],
                fontWeight: chat['unread'] > 0 ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat['time'],
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                  ),
                ),
                if (chat['unread'] > 0)
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      chat['unread'].toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailScreen(chat: chat),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ChatDetailScreen extends StatelessWidget {
  final Map<String, dynamic> chat;

  const ChatDetailScreen({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(chat['avatar']),
            ),
            SizedBox(width: 10),
            Text(
              chat['name'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
        backgroundColor: isDark ? Colors.black : Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: chat['messages'].length,
              itemBuilder: (context, index) {
                final message = chat['messages'][index];
                final isMe = message['sender'] == 'me';
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: isMe
                          ? theme.primaryColor
                          : (isDark ? Colors.grey[800] : Colors.grey[200]),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message['text'],
                          style: TextStyle(
                            color: isMe ? Colors.white : (isDark ? Colors.white : Colors.black),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          message['time'],
                          style: TextStyle(
                            fontSize: 10,
                            color: isMe ? Colors.white70 : (isDark ? Colors.grey[400] : Colors.grey[600]),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[900] : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.attach_file, color: isDark ? Colors.white : Colors.black),
                  onPressed: () {
                    // Implement file attachment
                  },
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: isDark ? Colors.grey[800] : Colors.grey[200],
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: theme.primaryColor),
                  onPressed: () {
                    // Implement send message
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}