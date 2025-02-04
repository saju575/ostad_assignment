import 'package:assignment_02/styles/app_text_style.dart';
import 'package:assignment_02/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeFeature extends StatefulWidget {
  const HomeFeature({super.key});

  @override
  State<HomeFeature> createState() => _HomeFeatureState();
}

class _HomeFeatureState extends State<HomeFeature> {
  List<Map<String, String>> contacts = [];

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _numberController = TextEditingController();

  void _addContact() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        contacts.add({
          "name": _nameController.text,
          "number": _numberController.text,
        });
      });
      _nameController.clear();
      _numberController.clear();
    }
  }

  void _removeContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  void _confirmDelete(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              backgroundColor: AppColors.whiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              title: const Text(
                "Confirmation",
                style:
                    TextStyle(color: AppColors.textPrimaryColor, fontSize: 20),
              ),
              content: const Text(
                "Are you sure for deleting?",
                style:
                    TextStyle(color: AppColors.textPrimaryColor, fontSize: 16),
              ),
              actions: [
                IconButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    icon: const Icon(Icons.cancel)),
                IconButton(
                    onPressed: () {
                      _removeContact(index);
                      Navigator.of(ctx).pop();
                    },
                    icon: const Icon(Icons.delete))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Form(
              key: _formKey,
              child: Column(children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Name cannot be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _numberController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Number',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Number cannot be empty";
                    }
                    if (!RegExp(r'^\d+$').hasMatch(value)) {
                      return "Enter a valid number";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: _addContact,
                  child: Container(
                    height: 35,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text('Add',
                          style: AppTextStyles.regular.copyWith(
                            color: AppColors.whiteColor,
                          )),
                    ),
                  ),
                )
              ])),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return ContactCard(
                name: contacts[index]["name"]!,
                number: contacts[index]["number"]!,
                onLongPress: () {
                  _confirmDelete(context, index);
                },
              );
            },
          ))
        ],
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  const ContactCard(
      {super.key,
      required String name,
      required String number,
      void Function()? onLongPress})
      : _name = name,
        _number = number,
        _onLongPress = onLongPress;

  final String _name;
  final String _number;
  final void Function()? _onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: _onLongPress,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6), // Rounded corners
        ),
        elevation: 3,
        shadowColor: Colors.transparent,
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: ListTile(
          tileColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(6), // Rounded edges inside the card
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          title: Text(_name,
              style: AppTextStyles.regular
                  .copyWith(color: AppColors.textPrimaryColor, fontSize: 18)),
          subtitle: Text(
            _number,
            style: AppTextStyles.regular.copyWith(
              color: AppColors.textPrimaryColor,
            ),
          ),
          trailing: const Icon(Icons.phone),
          leading: const CircleAvatar(
            backgroundColor: AppColors.backgroundColor,
            radius: 20,
            child: Icon(
              Icons.person,
              size: 36,
            ),
          ),
        ),
      ),
    );
  }
}
