import 'package:flutter/material.dart';

class CustomTodoTile extends StatelessWidget {
  final String title;
  final bool value;
  final void Function(bool?)? onChanged;
  const CustomTodoTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(children: [
        Checkbox(value: value, onChanged: onChanged),
        const SizedBox(width: 20,),
        Text(
          title,
          style: TextStyle(
            fontSize: 20
          ),          
        ),
      ]),
    );
  }
}