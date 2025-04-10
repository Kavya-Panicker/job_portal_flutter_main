class UserSocial {
  final String userId;
  final List<String> followers;
  final List<String> following;
  final List<Post> posts;
  final Map<String, List<String>> skillEndorsements; // Map of skill to list of endorser IDs
  final double profileStrength; // 0.0 to 1.0

  UserSocial({
    required this.userId,
    this.followers = const [],
    this.following = const [],
    this.posts = const [],
    this.skillEndorsements = const {},
    this.profileStrength = 0.0,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'followers': followers,
      'following': following,
      'posts': posts.map((post) => post.toJson()).toList(),
      'skillEndorsements': skillEndorsements,
      'profileStrength': profileStrength,
    };
  }

  factory UserSocial.fromJson(Map<String, dynamic> json) {
    return UserSocial(
      userId: json['userId'],
      followers: List<String>.from(json['followers'] ?? []),
      following: List<String>.from(json['following'] ?? []),
      posts: (json['posts'] as List<dynamic>?)
          ?.map((post) => Post.fromJson(post))
          .toList() ??
          [],
      skillEndorsements: Map<String, List<String>>.from(
        json['skillEndorsements']?.map(
              (key, value) => MapEntry(
                key,
                List<String>.from(value),
              ),
            ) ??
            {},
      ),
      profileStrength: json['profileStrength']?.toDouble() ?? 0.0,
    );
  }
}

class Post {
  final String id;
  final String userId;
  final String content;
  final DateTime createdAt;
  final List<String> likes;
  final List<Comment> comments;

  Post({
    required this.id,
    required this.userId,
    required this.content,
    required this.createdAt,
    this.likes = const [],
    this.comments = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
      'likes': likes,
      'comments': comments.map((comment) => comment.toJson()).toList(),
    };
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      userId: json['userId'],
      content: json['content'],
      createdAt: DateTime.parse(json['createdAt']),
      likes: List<String>.from(json['likes'] ?? []),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((comment) => Comment.fromJson(comment))
          .toList() ??
          [],
    );
  }
}

class Comment {
  final String id;
  final String userId;
  final String content;
  final DateTime createdAt;

  Comment({
    required this.id,
    required this.userId,
    required this.content,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      userId: json['userId'],
      content: json['content'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}