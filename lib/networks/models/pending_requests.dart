class pending_requests_model {
  String? name;
  String? email;
  int? age;
  int? id;
  String? type;
  String? status;
  String? image;
  String? address;
  int? phone;

  pending_requests_model(
      {this.name,
        this.email,
        this.age,
        this.id,
        this.type,
        this.status,
        this.image,
        this.address,
        this.phone});

  pending_requests_model.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    age = json['age'];
    id = json['id'];
    type = json['type'];
    status = json['status'];
    image = json['image'];
    address = json['address'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['age'] = this.age;
    data['id'] = this.id;
    data['type'] = this.type;
    data['status'] = this.status;
    data['image'] = this.image;
    data['address'] = this.address;
    data['phone'] = this.phone;
    return data;
  }
}