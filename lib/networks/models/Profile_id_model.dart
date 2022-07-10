class profile_model {
  int? status;
  String? message;
  Data? data;

  profile_model({this.status, this.message, this.data});

  profile_model.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;
  String? email;
  int? age;
  String? address;
  double? longitude;
  double? latitude;
  int? phone;
  String? image;
  String? college;
  String? createdAt;
  String? updatedAt;
  int? profileId;

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
        this.updatedAt,
        this.profileId});

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
    profileId = json['profile-id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['age'] = this.age;
    data['address'] = this.address;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['college'] = this.college;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['profile-id'] = this.profileId;
    return data;
  }
}