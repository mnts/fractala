import 'dart:async';

class TaskF {
  static final _map = <String, TaskF>{};
  factory TaskF(String name) => _map[name] ??= TaskF._(
        name,
      );

  final String name;
  final completer = Completer();
  TaskF._(
    this.name,
  );

  static Future after(String cmd) async {
    final task = _map[cmd];
    if (task == null) return;
    if (task.completer.isCompleted) return;
    /*
    if (cmd.startsWith('upload ')) {
      final hash = cmd.substring(7);
      if (FData.cache.containsKey(hash)) {
        return completer.complete();
      }
    }
    */
    return task.completer;
  }

  complete() {
    completer.complete();
  }
}
