class photoModel {
  int? _albumId;
  int? _id;
  String? _title;
  String? _url;
  String? _thumbnailUrl;

  photoModel(
      {int? albumId,
        int? id,
        String? title,
        String? url,
        String? thumbnailUrl}) {
    if (albumId != null) {
      this._albumId = albumId;
    }
    if (id != null) {
      this._id = id;
    }
    if (title != null) {
      this._title = title;
    }
    if (url != null) {
      this._url = url;
    }
    if (thumbnailUrl != null) {
      this._thumbnailUrl = thumbnailUrl;
    }
  }

  int? get albumId => _albumId;
  set albumId(int? albumId) => _albumId = albumId;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get url => _url;
  set url(String? url) => _url = url;
  String? get thumbnailUrl => _thumbnailUrl;
  set thumbnailUrl(String? thumbnailUrl) => _thumbnailUrl = thumbnailUrl;

  photoModel.fromJson(Map<String, dynamic> json) {
    _albumId = json['albumId'];
    _id = json['id'];
    _title = json['title'];
    _url = json['url'];
    _thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this._albumId;
    data['id'] = this._id;
    data['title'] = this._title;
    data['url'] = this._url;
    data['thumbnailUrl'] = this._thumbnailUrl;
    return data;
  }
}