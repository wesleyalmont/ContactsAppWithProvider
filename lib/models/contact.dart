class ContactModel {
  final String name;
  final String phone;
  final DateTime birthday;
  final String createdAt;
  final String image;
  final String type;

  ContactModel(
      {required this.name,
      required this.phone,
      required this.birthday,
      required this.createdAt,
      required this.image,
      required this.type});
}
