import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'dart:math';
import 'package:school/objects/ColorChoice.dart';

enum TodoCardSettings { edit_color, delete }

class TodoObject {
  TodoObject(String title) {
    this.title = title;

    ColorChoice choice = ColorChoices.choices[Random().nextInt(ColorChoices.choices.length)];
    this.color = choice.primary;
    this.gradient = LinearGradient(colors: choice.gradient, begin: Alignment.bottomCenter, end: Alignment.topCenter);
    tasks = Map<DateTime, List<TaskObject>>();
    this.uuid = Uuid().v1();
  }

  TodoObject.import(String uuidS, String title, int sortID, ColorChoice color,   Map<DateTime, List<TaskObject>> tasks) {
    this.sortID = sortID;
    this.title = title;
    this.color = color.primary;
    this.gradient = LinearGradient(colors: color.gradient, begin: Alignment.bottomCenter, end: Alignment.topCenter);

    this.tasks = tasks;
    this.uuid = uuidS;
  }

  String uuid;
  int sortID;
  String title;
  Color color;
  LinearGradient gradient;

  Map<DateTime, List<TaskObject>> tasks;

  int taskAmount() {
    int amount = 0;
    tasks.values.forEach((list) {
      amount += list.length;
    });
    return amount;
  }

  //List<TaskObject> tasks;

  double percentComplete() {
    if (tasks.isEmpty) {
      return 1.0;
    }
    int completed = 0;
    int amount = 0;
    tasks.values.forEach((list) {
      amount += list.length;
      list.forEach((task) {
        if (task.isCompleted()) {
          completed++;
        }
      });
    });
    return completed / amount;
  }
}

class TaskObject {

  String task;
  bool _completed;

  TaskObject(String task) {
    this.task = task;

    this._completed = false;
  }

  TaskObject.import(String task, bool completed) {
    this.task = task;

    this._completed = completed;
  }

  void setComplete(bool value) {
    _completed = value;
  }

  isCompleted() => _completed;
}
