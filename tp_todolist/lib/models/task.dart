class Task {
  String? content;
  int? id;
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


// TextFormField: For single-line text input.
// TextField: For multi-line text input.
// DropdownButtonFormField: For selecting an option from a dropdown menu.
// CheckboxListTile: For selecting multiple options from a list of checkboxes.
// RadioListTile: For selecting a single option from a list of radio buttons.
// Switch: For a toggle switch input.
// DatePickerFormField: For selecting a date from a date picker.
// TimePickerFormField: For selecting a time from a time picker.