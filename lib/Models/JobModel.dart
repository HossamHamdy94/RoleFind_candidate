class Job {
  int id;
  String name;
  String bio;
  int age;
  Job({this.id, this.name, this.bio, this.age});
  factory Job.fromJson(Map<String, dynamic> author) => Job(
      id: author['id'],
      name: author['name'],
      bio: author['bio'],
      age: author['age']);
  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'bio': bio, 'age': age};
}