class ContactModel {
  final int? id;
  final String name;
  final String phone;
  final String birthday;
  final String createdAt;
  final String image;
  final String type;

  ContactModel(this.id,
      {required this.name,
      required this.phone,
      required this.birthday,
      required this.createdAt,
      required this.image,
      required this.type});

  factory ContactModel.fromMap(Map<String, dynamic> json) {
    return ContactModel(json['id'],
        name: json['name'],
        phone: json['phone'],
        birthday: json['birthday'],
        createdAt: json['createdAt'],
        image: json['image'],
        type: json['type']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'birthday': birthday,
      'createdAt': createdAt,
      'image': image,
      'type': type
    };
  }
}
