class Task {
  String? content;
  String? id;
  String? userId;
  bool done;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deadline;
  String? category;
  int? priority;

  Task({
    this.content,
    this.id,
    this.userId,
    this.done = false,
    this.createdAt,
    this.updatedAt,
    this.deadline,
    this.category,
    this.priority,
  });
}
