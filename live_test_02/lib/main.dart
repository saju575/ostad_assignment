import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:live_test_02/screens/home.dart';
// import 'package:live_test_02/screens/todo.dart';
import 'package:live_test_02/screens/water_tracker.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const WaterTrackerScreen());
  }
}

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({
    super.key,
  });

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _salaryController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _salaryController.dispose();
    super.dispose();
  }

  void _addEmployee() {
    if (_formKey.currentState!.validate()) {
      // Process the data
      String name = _nameController.text;
      int age = int.tryParse(_ageController.text) ?? 0;
      double salary = double.tryParse(_salaryController.text) ?? 0.0;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Employee Added:\nName: $name, Age: $age, Salary: $salary'),
          duration: const Duration(seconds: 3),
        ),
      );

      //  clear the form fields after submission
      _nameController.clear();
      _ageController.clear();
      _salaryController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  labelText: 'Age',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an age';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid age';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _salaryController,
                decoration: const InputDecoration(
                  labelText: 'Salary',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a salary';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid salary';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _addEmployee,
                child: const Text('Add Employee'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
