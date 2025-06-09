import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/task.dart';
import '../viewmodels/task_view_model.dart';

class AddTaskScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  DateTime _dueDate = DateTime.now();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final newTask = Task(
        id: DateTime.now().millisecondsSinceEpoch,
        title: _title,
        description: _description,
        dueDate: _dueDate,
        isCompleted: false,
      );
      ref.read(taskListProvider.notifier).addTask(newTask);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Task'), elevation: 8, // Higher elevation = deeper shadow
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title',border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5), // Rounded corners
                ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey), // Optional custom color
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(color: Colors.purple, width: 2.0), // On focus
                    ),),
                validator: (value) => value!.isEmpty ? 'Enter a title' : null,
                onChanged: (value) => _title = value,
              ),
              SizedBox(height: 10.0,),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description',border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5), // Rounded corners
                ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey), // Optional custom color
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(color: Colors.purple, width: 2.0), // On focus
                  ),),
                onChanged: (value) => _description = value,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Add Task'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
