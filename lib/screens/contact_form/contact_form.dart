import 'package:flutter/material.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Contact")),
      body: const SafeArea(
          child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(child: _ContactFormInputs()),
      )),
    );
  }
}

class _ContactFormInputs extends StatelessWidget {
  const _ContactFormInputs({super.key});

  @override
  Widget build(BuildContext context) {
    final _contactFormKey = GlobalKey<FormState>();

    return Form(
      key: _contactFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // NAME
              TextFormField(
                validator: (value) => value == "" ? "Type a Name" : null,
                decoration: const InputDecoration(
                  hintText: "Name",
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(31, 151, 150, 150),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // PHONE NUMBER
              TextFormField(
                validator: (value) =>
                    value == "" ? "Type a Phone Number" : null,
                decoration: const InputDecoration(
                  hintText: "PhoneNumber",
                  prefixIcon: Icon(
                    Icons.phone,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(31, 151, 150, 150),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // TYPE OF NUMBER
              TextFormField(
                validator: (value) =>
                    value == "" ? "Please speficy the type of phone" : null,
                decoration: const InputDecoration(
                  hintText: "Type",
                  prefixIcon: Icon(
                    Icons.edit_note_sharp,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(31, 151, 150, 150),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // IMAGE URL
              TextFormField(
                validator: (value) =>
                    value == "" ? "This field cannot be empty" : null,
                decoration: const InputDecoration(
                  hintText: "Image URL",
                  prefixIcon: Icon(
                    Icons.image,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(31, 151, 150, 150),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                if (_contactFormKey.currentState!.validate()) {
                  SnackBar(content: Text('teste'));
                }
              },
              child: Text("Save contact"))
        ],
      ),
    );
  }
}
