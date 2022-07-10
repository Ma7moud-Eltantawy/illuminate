class stu_model {
  int? status;
  String? message;
  Data? data;

  stu_model({this.status, this.message, this.data});

  stu_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Profile? profile;

  Data({this.profile});

  Data.fromJson(Map<String, dynamic> json) {
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Profile {
  int? userId;
  String? name;
  String? email;
  int? age;
  String? address;
  double? longitude;
  int? profileId;
  double? latitude;
  String? createdAt;
  String? updatedAt;
  String? image;
  int? phone;

  Profile(
      {this.userId,
        this.name,
        this.email,
        this.age,
        this.address,
        this.longitude,
        this.profileId,
        this.latitude,
        this.createdAt,
        this.updatedAt,
        this.image,
        this.phone});

  Profile.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    age = json['age'];
    address = json['address'];
    longitude = json['longitude'];
    profileId = json['profile_id'];
    latitude = json['latitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['age'] = this.age;
    data['address'] = this.address;
    data['longitude'] = this.longitude;
    data['profile_id'] = this.profileId;
    data['latitude'] = this.latitude;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    data['phone'] = this.phone;
    return data;
  }
}