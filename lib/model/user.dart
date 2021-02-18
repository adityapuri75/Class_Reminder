class User {
  String type;
  String sId;
  String image;
  String googleId;
  String group;
  String section;
  String university;
  int iV;

  User(
      {this.type,
      this.sId,
      this.image,
      this.googleId,
      this.group,
      this.section,
      this.university,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    sId = json['_id'];
    image = json['image'];
    googleId = json['googleId'];
    group = json['group'];
    section = json['section'];
    university = json['university'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['_id'] = this.sId;
    data['image'] = this.image;
    data['googleId'] = this.googleId;
    data['group'] = this.group;
    data['section'] = this.section;
    data['university'] = this.university;
    data['__v'] = this.iV;
    return data;
  }
}