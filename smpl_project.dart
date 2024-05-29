import 'dart:io';

class Task {
  String description;
  bool isCompleted;
  Task(this.description, {this.isCompleted = false});
  @override
  String toString() {
    return '${isCompleted ? "[x]" : "[ ]"}$description';
  }
}

//task manager class

class TaskManager {
  List<Task> tasks = [];
  void addTask(String description) {
    tasks.add(Task(description));
    print('task added');
  }

//view task

  void viewTasks() {
    if (tasks.isEmpty) {
      print('no tasks available');
    } else {
      for (int i = 0; i < tasks.length; i++) {
        print('${i + 1}. ${tasks[i]}');
      }
    }
  }

//update task

  void updateTask(int index, String newDescription) {
    if (index < 0 || index >= tasks.length) {
      print('invalid task');
    } else {
      tasks[index].description = newDescription;
      print('task updated');
    }
  }

  void markTaskAsComplete(int index) {
    if (index < 0 || index >= tasks.length) {
      print('invalid task index');
    } else {
      tasks[index].isCompleted = true;
      print('task marked as complete');
    }
  }

//delete task

  void deleteTask(int index) {
    if (index < 0 || index >= tasks.length) {
      print('invalid task index');
    } else {
      tasks.removeAt(index);
      print('task deleted');
    }
  }
}

// Main Function
void main() {
  TaskManager taskManager = TaskManager();
  while (true) {
    print('''
1. Add Task
2. View Tasks
3. Update Task
4. Mark Task as Complete
5. Delete Task
6. Exit
select a task: ''');
    String? choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        print('enter a description:');
        String? description = stdin.readLineSync();
        if (description != null && description.isNotEmpty) {
          taskManager.addTask(description);
        } else {
          print('invalid description');
        }
        break;
      case '2':
        taskManager.viewTasks();
        break;
      case '3':
        taskManager.viewTasks();
        print('enter task number to update:');
        String? indexStr = stdin.readLineSync();
        int? index = int.tryParse(indexStr ?? '') ?? -1;
        print('enter new task description:');
        String? newDescription = stdin.readLineSync();
        if (newDescription != null && newDescription.isNotEmpty) {
          taskManager.updateTask(index - 1, newDescription);
        } else {
          print('invalid description');
        }
        break;
      case '4':
        taskManager.viewTasks();
        print('enter task number to mark as complete:');
        String? indexStr = stdin.readLineSync();
        int? index = int.tryParse(indexStr ?? '') ?? -1;
        taskManager.markTaskAsComplete(index - 1);
        break;
      case '5':
        taskManager.viewTasks();
        print('enter task number to delete:');
        String? indexStr = stdin.readLineSync();
        int? index = int.tryParse(indexStr ?? '') ?? -1;
        taskManager.deleteTask(index - 1);
        break;
      case '6':
        print('exiting Task Manager');
        return;
      default:
        print('invalid choice');
    }
    print('');
  }
}
