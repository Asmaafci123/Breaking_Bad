class Character
{
  int? char_id;
  String? name;
  String? birthday;
  String? nickname;
  String? img;
  String? portrayed;//actor name
  String? category;//which series
  String? status;// died or alive
  List<dynamic>? occupation;
  List<dynamic>? appearance;//list of session of breaking bad
  List<dynamic>? better_call_saul_appearance;//list of session of call_saul
  Character.fromJson(Map<String,dynamic>json)
  {
    char_id=json['char_id'];
    img=json['img'];
    name=json['name'];
    birthday=json['birthday'];
    nickname=json['nickname'];
    status=json['status'];
    portrayed=json['portrayed'];
    category=json['category'];
    occupation=json['occupation'];
    appearance=json['appearance'];
    better_call_saul_appearance=json['better_call_saul_appearance'];
  }
}