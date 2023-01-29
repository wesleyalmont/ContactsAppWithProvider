import 'dart:ffi';

import 'package:contactsprovider/mocks/contacts.dart';
import 'package:contactsprovider/screens/components/contact_card.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ContactCard(
              contact: contacts[index],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/form');
        },
        child: const Icon(Icons.add_outlined),
      ),
    );
  }
}
