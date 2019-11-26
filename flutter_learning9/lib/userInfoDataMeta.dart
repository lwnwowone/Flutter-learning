class UserinfoDataMeta {
  String englishName;
  String chineseName;
  int age;

  UserinfoDataMeta(Map<String, dynamic> infoMap) {
    englishName = infoMap["english_name"];
    chineseName = infoMap["chinese_name"];
    age = infoMap["age"];
  }
}