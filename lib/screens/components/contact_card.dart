import 'package:contactsprovider/models/contact.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final ContactModel contact;
  const ContactCard({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(height: 50, contact.image),
              Column(
                children: [
                  Text(contact.name),
                  Text(
                    contact.phone,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Type",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(contact.type),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
