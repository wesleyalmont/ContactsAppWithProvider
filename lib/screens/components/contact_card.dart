import 'package:contactsprovider/models/contact.dart';
import 'package:contactsprovider/providers/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactCard extends StatelessWidget {
  final ContactModel contact;
  const ContactCard({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(contact.id);
      },
      onLongPress: () {
        
        Provider.of<ContactsProvider>(context, listen: false)
            .remove(contact.id!);
      },
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
