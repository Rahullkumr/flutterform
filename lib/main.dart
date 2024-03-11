import 'package:flutter/material.dart';
import 'package:myapp/new_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  MyFormState createState() => MyFormState();
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  String gender = 'male';
  bool subscribe = false;
  int age = 0;
  DateTime? birthday;
  String country = 'India';
  String bio = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form with multiple inputs'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onSaved: (value) {
                  name = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                onSaved: (value) {
                  email = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                onSaved: (value) {
                  password = value!;
                },
              ),
              ListTile(
                title: const Text('Male'),
                leading: Radio(
                  value: 'male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Female'),
                leading: Radio(
                  value: 'female',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
              ),
              CheckboxListTile(
                title: const Text('Subscribe to newsletter'),
                value: subscribe,
                onChanged: (bool? value) {
                  setState(() {
                    subscribe = value!;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  int? parsedAge = int.tryParse(value!);
                  if (parsedAge != null) {
                    age = parsedAge;
                  }
                },
              ),
              ListTile(
                title: const Text('Birthday'),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && picked != birthday) {
                    final selectedDate = DateTime(picked.year, picked.month, picked.day);
                    setState(
                      () {
                        birthday = selectedDate;
                      },
                    );
                  }
                },
              ),
              DropdownButtonFormField(
                value: country,
                items: ['United States', 'India', 'Australia']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    country = newValue!;
                  });
                },
                decoration: const InputDecoration(labelText: 'Country'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Bio'),
                maxLines: 4,
                onSaved: (value) {
                  bio = value!;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return NewPage(
                              name: name,
                              age: age,
                              bio: bio,
                              birthday: birthday,
                              country: country,
                              email: email,
                              gender: gender,
                              password: password,
                              subscribe: subscribe,
                            );
                          },
                        ),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
