import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalenderWidget extends StatefulWidget {
  final FormFieldValidator<String> validatorFunc;
  final TextEditingController datePickerController;
  final String? hintTextTile;
  final String? labelText;

  const CalenderWidget({
    super.key,
    this.hintTextTile,
    required this.validatorFunc,
    required this.datePickerController,
    this.labelText,
  });

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  final FocusNode focusNode = FocusNode();
  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 5),
      child: TextFormField(
        focusNode: focusNode,
        validator: widget.validatorFunc,
        controller: widget.datePickerController,
        decoration: InputDecoration(
          hintText: widget.hintTextTile,
          labelText: widget.labelText,
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                lastDate: DateTime(2030),
                firstDate: DateTime(1900),
                initialDate: DateTime.now(),
              );
              if (pickedDate == null) return;
              widget.datePickerController.text =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
              focusNode.requestFocus();
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
