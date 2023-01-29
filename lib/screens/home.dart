import 'package:contactsprovider/providers/contact_provider.dart';
import 'package:contactsprovider/screens/components/contact_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        elevation: 0,
      ),
      body: SafeArea(child: Consumer<ContactsProvider>(
        builder: (context, contactsProvider, child) {
          return FutureBuilder(
            future: contactsProvider.getAllContacts(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data!.isEmpty) {
                return Text("Nada a mostrar");
              }

              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    background: Container(color: Colors.red),
                    key: Key(snapshot.data![index].id.toString()),
                    onDismissed: (DismissDirection direction) async {
                      await Provider.of<ContactsProvider>(context,
                              listen: false)
                          .remove(snapshot.data![index].id!);
                    },
                    child: ContactCard(
                      contact: snapshot.data![index],
                    ),
                  );
                },
              );
            },
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/form');
        },
        child: const Icon(Icons.add_outlined),
      ),
    );
  }
}
