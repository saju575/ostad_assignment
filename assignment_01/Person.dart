import 'Role.dart';

class Person implements Role {
  late String _name;
  late int _age;
  String? _address;

  Person({
    required String name,
    required int age,
    String? address,
  })  : _name = name,
        _age = age,
        _address = address;

  String get name => _name;
  int get age => _age;
  String? get address => _address;

  set name(String name) => _name = name;
  set age(int age) => _age = age;
  set address(String? address) => _address = address;

  @override
  void displayRole() {
    print('Role: Person');
  }

  void displayPersonInfo() {
    print(
        'Person name is $_name, age is $_age, ${_address != null ? 'address is $_address' : 'No address'}');
  }
}
