import 'package:contact_app/screen/contact/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';
class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const CircleAvatar(
                radius: 60,
              ),
              const SizedBox(
                height: 5,
              ),
              IconButton.filledTonal(
                  onPressed: () {}, icon: const Icon(Icons.camera_alt)),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                child: TextFormField(
                  controller: txtName,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text("Name")),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Name is required";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                child: TextFormField(
                  controller: txtMobile,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text("Mobile")),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Mobile is required";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                child: TextFormField(
                  controller: txtEmail,
                  decoration:  InputDecoration(
                      border: OutlineInputBorder(), label: Text("Email")),
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!)) {
                        return "Email is  not valid";
                      }
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      String Name = txtName.text;
                      String Email = txtEmail.text;
                      String Mobile = txtMobile.text;

                        ContactModel c1 = ContactModel(name: Name,email: Email,mobile: Mobile);
                      // context.read<HomeProvider>().addContact(c1);
                        context.read<HomeProvider>().addContact(c1);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}
