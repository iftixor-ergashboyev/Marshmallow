class LoveRandom {
  int? random;

  LoveRandom({this.random});

  LoveRandom.fromJson(Map<String, dynamic> json) {
    random = json['random'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['random'] = random;
    return data;
  }
}