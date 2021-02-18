class TimeTable {
  String sId;
  String section;
  String group;
  String time;
  String date;
  String subject;
  String link;

  TimeTable(
      {this.sId,
      this.section,
      this.group,
      this.time,
      this.date,
      this.subject,
      this.link});

  TimeTable.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    section = json['section'];
    group = json['group'];
    time = json['time'];
    date = json['date'];
    subject = json['subject'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['section'] = this.section;
    data['group'] = this.group;
    data['time'] = this.time;
    data['date'] = this.date;
    data['subject'] = this.subject;
    data['link'] = this.link;
    return data;
  }
}