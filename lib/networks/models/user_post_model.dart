class user_post_model {
  int? id;
  String? name;
  String? email;
  String? gender;
  String? status;

  user_post_model({this.id, this.name, this.email, this.gender, this.status});

  user_post_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['gender'] = gender;
    data['status'] = status;
    return data;
  }
}