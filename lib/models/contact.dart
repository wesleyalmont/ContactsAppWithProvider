class ContactModel {
  final String name;
  final String phone;
  final DateTime birthday;
  final String createdAt;
  final String image;

  ContactModel(
      {required this.name,
      required this.phone,
      required this.birthday,
      required this.createdAt,
      required this.image});
}
