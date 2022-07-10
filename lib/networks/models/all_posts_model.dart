class all_posts_model {
  String? message;
  List<Data>? data;

  all_posts_model({this.message, this.data});

  all_posts_model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? body;
  String? image;
  int? userId;
  String? createdAt;
  String? updatedAt;
  int? commentsCount;
  int? likesCount;
  String? humanReadableCreatedAt;
  List<Likes>? likes;

  Data(
      {this.id,
        this.body,
        this.image,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.commentsCount,
        this.likesCount,
        this.humanReadableCreatedAt,
        this.likes});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    body = json['body'];
    image = json['image'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    commentsCount = json['comments_count'];
    likesCount = json['likes_count'];
    humanReadableCreatedAt = json['human_readable_created_at'];
    if (json['likes'] != null) {
      likes = <Likes>[];
      json['likes'].forEach((v) {
        likes!.add(new Likes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['body'] = this.body;
    data['image'] = this.image;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['comments_count'] = this.commentsCount;
    data['likes_count'] = this.likesCount;
    data['human_readable_created_at'] = this.humanReadableCreatedAt;
    if (this.likes != null) {
      data['likes'] = this.likes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Likes {
  int? id;
  int? postId;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Likes({this.id, this.postId, this.userId, this.createdAt, this.updatedAt});

  Likes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['post_id'] = this.postId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}