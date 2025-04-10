import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  final String userName;
  final String userTitle;
  final String userAvatarUrl;
  final String postContent;
  final String? postImageUrl;
  final DateTime postTime;

  const PostCard({
    Key? key,
    required this.userName,
    required this.userTitle,
    required this.userAvatarUrl,
    required this.postContent,
    this.postImageUrl,
    required this.postTime,
  }) : super(key: key);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info Row
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.userAvatarUrl),
                  radius: 24,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.userName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.userTitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        '${_getTimeAgo(widget.postTime)}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            
            // Post Content
            Text(
              widget.postContent,
              style: TextStyle(fontSize: 16),
            ),
            
            // Post Image (if any)
            if (widget.postImageUrl != null) ...[              
              SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.postImageUrl!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
            
            SizedBox(height: 16),
            
            // Interaction Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInteractionButton(
                  icon: isLiked ? Icons.favorite : Icons.favorite_border,
                  label: 'Like',
                  color: isLiked ? Colors.red : Colors.grey,
                  onTap: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                ),
                _buildInteractionButton(
                  icon: Icons.comment_outlined,
                  label: 'Comment',
                  onTap: () {
                    // TODO: Implement comment functionality
                  },
                ),
                _buildInteractionButton(
                  icon: Icons.share_outlined,
                  label: 'Share',
                  onTap: () {
                    // TODO: Implement share functionality
                  },
                ),
                _buildInteractionButton(
                  icon: isSaved ? Icons.bookmark : Icons.bookmark_border,
                  label: 'Save',
                  color: isSaved ? Colors.lightBlue : Colors.grey,
                  onTap: () {
                    setState(() {
                      isSaved = !isSaved;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInteractionButton({
    required IconData icon,
    required String label,
    Color color = Colors.grey,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(icon, size: 20, color: color),
            SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getTimeAgo(DateTime postTime) {
    final now = DateTime.now();
    final difference = now.difference(postTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}