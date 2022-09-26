class MSHomeMoviceModelItem {
  int rank = 0;
  late String vod_name;
  late String vod_pic;
  late String vod_actor;
  late String vod_class;
  late String vod_area;
  late String vod_year;
  late String vod_lang;
  late String vod_blurb;
  late String vod_remarks;
  late double vod_score;

  MSHomeMoviceModelItem.fromMap(Map<String, dynamic> dict) {
    vod_name = dict["vod_name"];
    vod_pic = dict["vod_pic"];
    vod_actor = dict["vod_actor"];
    vod_class = dict["vod_class"];
    vod_area = dict["vod_area"];
    vod_year = dict["vod_year"];
    vod_lang = dict["vod_lang"];
    vod_blurb = dict["vod_blurb"];
    vod_remarks = dict["vod_remarks"];
    vod_score = double.parse(dict["vod_score"]);
  }

  @override
  String toString() {
    return 'MSHomeMoviceModelItem{vod_name: $vod_name, vod_pic: $vod_pic, vod_actor: $vod_actor, vod_class: $vod_class, vod_area: $vod_area, vod_year: $vod_year, vod_lang: $vod_lang, vod_blurb: $vod_blurb, vod_remarks: $vod_remarks}';
  }
}
