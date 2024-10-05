import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Function()? action;

  const AppButton({
    super.key,
    required this.label,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green,),
        onPressed: action,
        child: Text(label, style: const TextStyle(color: Colors.white),),
      ),
    );
  }
}