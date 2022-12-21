class BeritaModel {
  bool? success;
  String? message;
  List<Results>? data;

  BeritaModel({this.success, this.message, this.data});

  BeritaModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Results>[];
      json['data']['posts'].forEach((v) {
        data!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? title;
  String? description;
  String? thumbnail;
  String? pubDate;

  Results({
    this.title,
    this.description,
    this.thumbnail,
    this.pubDate,
  });

  Results.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    pubDate = json['pubDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['pubDate'] = this.pubDate;
    return data;
  }
}
