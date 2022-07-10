class comments {
  int? id;
  int? userId;
  String? email;
  int? phone;
  int? postId;
  String? body;
  String? humanReadableCreatedAt;
  String? userName;
  String? userImage;

  comments(
      {this.id,
        this.userId,
        this.email,
        this.phone,
        this.postId,
        this.body,
        this.humanReadableCreatedAt,
        this.userName,
        this.userImage});

  comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    email = json['Email'];
    phone = json['Phone'];
    postId = json['post_id'];
    body = json['body'];
    humanReadableCreatedAt = json['human_readable_created_at'];
    userName = json['user_name'];
    userImage = json['user-image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['Email'] = this.email;
    data['Phone'] = this.phone;
    data['post_id'] = this.postId;
    data['body'] = this.body;
    data['human_readable_created_at'] = this.humanReadableCreatedAt;
    data['user_name'] = this.userName;
    data['user-image'] = this.userImage;
    return data;
  }
}