import 'package:flutter/material.dart';

void main() {
  runApp(const FormApp());
}

class FormApp extends StatelessWidget {
  const FormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormPage(),
    );
  }
}

// A screen that demonstrates the Flutter Form widget.
class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // The key gives us access to the form so we can validate it.
  final _formKey = GlobalKey<FormState>();

  // Controllers hold the text typed into each field.
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  void _submit() {
    // validate() runs every validator and returns true if all pass.
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Hello ${_nameController.text}!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Form')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        // The Form widget groups the fields together.
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Name field
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null; // null means the input is valid
                },
              ),

              // Email field
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50),

              // Submit button
              ElevatedButton(onPressed: _submit, child: const Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}
