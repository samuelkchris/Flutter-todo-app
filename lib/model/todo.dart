import 'package:flutter/material.dart';

class ToDo {
  String? id;
  String? todoText;
  String? title;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    required this.title,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [];
  }
}

class Feature {
  final String name;
  final Icon icon;

  Feature({required this.name, required this.icon});
}

List<Feature> features = [
  Feature(name: 'New Task', icon: const Icon(Icons.add)),
  Feature(name: 'Completed Tasks', icon: const Icon(Icons.check_box)),
  Feature(name: 'Prioritized Tasks', icon: const Icon(Icons.priority_high)),
  Feature(name: 'Tasks by Due Date', icon: const Icon(Icons.calendar_today)),
  Feature(name: 'Tasks by Category', icon: const Icon(Icons.category)),
  Feature(name: 'Repeating Tasks', icon: const Icon(Icons.repeat)),
  Feature(name: 'Shared Tasks', icon: const Icon(Icons.people)),
  Feature(name: 'Task Reminders', icon: const Icon(Icons.notifications)),
  Feature(name: 'Task Attachments', icon: const Icon(Icons.attach_file)),
  Feature(name: 'Task Dependencies', icon: const Icon(Icons.link)),
  Feature(name: 'Task History', icon: const Icon(Icons.history)),
  Feature(name: 'Task Statistics', icon: const Icon(Icons.show_chart)),
  Feature(
      name: 'Integration with External Services',
      icon: const Icon(Icons.cloud)),
  Feature(name: 'Custom Task Fields', icon: const Icon(Icons.settings)),
  Feature(name: 'Collaboration Tools', icon: const Icon(Icons.group)),
  Feature(name: 'Import/Export Tasks', icon: const Icon(Icons.import_export)),
  Feature(name: 'Offline Access', icon: const Icon(Icons.offline_bolt)),
  Feature(name: 'Dark Mode', icon: const Icon(Icons.brightness_4)),
  Feature(name: 'Custom Themes', icon: const Icon(Icons.palette)),
  Feature(name: 'Customizable Widgets', icon: const Icon(Icons.dashboard)),
  Feature(name: 'Help/Support', icon: const Icon(Icons.help)),
];
