import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search users...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Theme.of(context).cardColor,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=${index + 1}'),
                ),
                title: Text('User ${index + 1}'),
                subtitle: Text('@user${index + 1}'),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text('View Profile'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
} 