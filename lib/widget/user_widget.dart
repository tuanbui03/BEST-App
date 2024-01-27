
import 'package:best/entity/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateUserWidget extends StatefulWidget{
  final Users? users;
  final ValueChanged<String> onSubmit;

  const CreateUserWidget({
    Key? key,
    this.users,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() =>_CreateUserWidgetState();

}

class _CreateUserWidgetState extends State<CreateUserWidget>{
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    controller.text = widget.users?.userName ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.users != null;
    return AlertDialog(
      title: Text(isEditing ? 'Edit User' : 'Add User'),
      content: Form(
        key: formKey,
        child: TextFormField(
          autofocus:  true,
          controller: controller,
          decoration: const InputDecoration(hintText: 'Title'),
          validator: (value) => value != null && value.isEmpty ? 'User is required' : null,
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        TextButton(onPressed: () {
          if(formKey.currentState!.validate()){
            widget.onSubmit(controller.text);
          }
        }
            , child: const Text('OK')),
      ],
    );
  }


}