class usermodel {
  int? status;
  String? message;
  Data? data;

  usermodel({this.status, this.message, this.data});

  usermodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
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
    json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}

class Profile {
  int? id;
  String? name;
  String? email;
  int? age;
  String? address;
  int? longitude;
  int? latitude;
  int? phone;
  String? image;
  String? college;
  String? createdAt;
  String? updatedAt;

  Profile(
      {this.id,
        this.name,
        this.email,
        this.age,
        this.address,
        this.longitude,
        this.latitude,
        this.phone,
        this.image,
        this.college,
        this.createdAt,
        this.updatedAt});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    age = json['age'];
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    phone = json['phone'];
    image = json['image'];
    college = json['college'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['age'] = age;
    data['address'] = address;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['phone'] = phone;
    data['image'] = image;
    data['college'] = college;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}