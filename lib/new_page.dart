import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewPage extends StatelessWidget {
  final String name;
  final String email;
  final String password;
  final String gender;
  final bool subscribe;
  final int age;
  final DateTime? birthday;
  final String country;
  final String bio;
  const NewPage({
    super.key,
    required this.name,
    required this.email,
    required this.password,
    required this.gender,
    required this.subscribe,
    required this.age,
    required this.birthday,
    required this.country,
    required this.bio,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recieved data"),
      ),
      body: Container(
        color: Colors.green.shade300,
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          children: [
            Text(name.toString()),
            Text(email.toString()),
            Text(password.toString()),
            Text(gender.toString()),
            Text(subscribe.toString()),
            Text(age.toString()),
            Text("Birthday: ${DateFormat('yyyy-MM-dd').format(birthday!)}"),
            Text(country.toString()),
            Text(bio.toString()),
          ],
        ),
      ),
    );
  }
}
