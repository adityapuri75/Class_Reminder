class Feedback {
  bool isDisplay;
  String sId;
  String section;
  String group;
  String feedback;
  int iV;

  Feedback(
      {this.isDisplay,
      this.sId,
      this.section,
      this.group,
      this.feedback,
      this.iV});

  Feedback.fromJson(Map<String, dynamic> json) {
    isDisplay = json['isDisplay'];
    sId = json['_id'];
    section = json['section'];
    group = json['group'];
    feedback = json['feedback'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDisplay'] = this.isDisplay;
    data['_id'] = this.sId;
    data['section'] = this.section;
    data['group'] = this.group;
    data['feedback'] = this.feedback;
    data['__v'] = this.iV;
    return data;
  }
}