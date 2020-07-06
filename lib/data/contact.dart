class Contact {
  int id;
  String name;
  int mobile_no;
  int landline_no;
  String avatar_path;
  bool isFavorite = false;

  Contact(
      {this.id,
      this.name,
      this.mobile_no,
      this.landline_no,
      this.avatar_path,
      this.isFavorite});

  factory Contact.fromDBJson(Map<String, dynamic> json) => new Contact(
      id: json['id'],
      name: json['name'],
      mobile_no: json['mobile_no'],
      landline_no: json['landline_no'],
      avatar_path: json['avatar_path'],
      isFavorite: json['isFavorite']);

  Map<String, dynamic> toDBJson() => {
        'id': id,
        'name': 'name',
        'mobile_no': 'mobile_no',
        'landline_no': 'landline_no',
        'avatar_path': 'avatar_path',
        'isFavorite': 'isFavorite',
      };
}
