import 'package:contactsprovider/providers/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController typeController = TextEditingController();
    final TextEditingController imageController = TextEditingController();
    final TextEditingController bdController = TextEditingController();
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
                controller: nameController,
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
                controller: phoneController,
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
                controller: typeController,
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
              // BirthDay
              TextFormField(
                controller: bdController,
                validator: (value) =>
                    value == "" ? "Please speficy the birthday" : null,
                decoration: const InputDecoration(
                  hintText: "Type",
                  prefixIcon: Icon(
                    Icons.calendar_month,
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
                  final contactProvider =
                      Provider.of<ContactsProvider>(context, listen: false);

                  contactProvider.insert(
                    name: nameController.text,
                    type: typeController.text,
                    birthday: bdController.text,
                    image: imageController.text.isEmpty
                        ? "https://ih1.redbubble.net/image.4598476168.2173/st,small,507x507-pad,600x600,f8f8f8.jpg"
                        : imageController.text,
                    phone: phoneController.text,
                  );
                }
              },
              child: Text("Save contact"))
        ],
      ),
    );
  }
}
