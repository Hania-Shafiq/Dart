import 'dart:io';

List<String> todo = [];

void main() {
  print('''
    Welcome to todo list.
    Select the number of the operation you
    want to perform.
    1. Add a task.
    2. Mark as completed.
    3. Display my tasks.
    4. Quit.
    ''');

  while (true) {
    int? input = int.tryParse(stdin.readLineSync()!);
    if (input == 1) {
      add_task();
    } else if (input == 2) {
      mark_completed();
    } else if (input == 3) {
      display_tasks();
    } else if (input == 4) {
      print('Exited');
      break; // Exit the loop when user selects option 4
    } else {
      print('Invalid input. Please select a number between 1 and 4.');
    }
    print('''
    
    Select the number of the operation you
    want to perform.
    1. Add a task.
    2. Mark as completed.
    3. Display my tasks.
    4. Quit.
    ''');

  }
}

void add_task() {
  print('Enter the task that you want to add');
  String? task = stdin.readLineSync();
  if (task != null && task.isNotEmpty) {
    todo.add(task);
    print("Task added sucessfully");
  } else {
    print('Task cannot be empty!');
  }
}

void mark_completed() {
  display_tasks();
  print('Enter the task index that you want to mark as completed');
  int? taskIndex = int.tryParse(stdin.readLineSync()!);
  if (taskIndex != null && taskIndex >= 0 && taskIndex < todo.length) {
    print('Task "${todo[taskIndex]}" marked as completed and removed from todo list.');
    todo.removeAt(taskIndex);
  } else {
    print('Invalid task index.');
  }
}

void display_tasks() {
  if (todo.isEmpty) {
    print('No tasks to display.');
  } else {
    print('Your tasks:');
    for (int i = 0; i < todo.length; i++) {
      print('$i. ${todo[i]}');
    }
  }
}