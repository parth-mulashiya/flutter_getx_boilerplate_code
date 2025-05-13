class TodoModel {
  int? id; // Nullable because the database will auto-generate it.
  String name;
  String description;

  TodoModel({this.id, required this.name, required this.description});

  // Convert a Item into a Map. This is what goes into the database.
  Map<String, dynamic> tJson() {
    return {'id': id, 'name': name, 'description': description};
  }

  // Convert a Map back into a Item.  This is how we read data from the database.
  TodoModel.fromJson(Map<String, dynamic> map)
    : id = map['id'],
      name = map['name'],
      description = map['description'];
}
