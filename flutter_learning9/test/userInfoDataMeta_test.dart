import 'package:test/test.dart';

import 'package:flutter_unit_test_with_mokito/userInfoDataMeta.dart';

void main() {
  test('Class UserInfoDataMeta unit test', () {
    Map<String, dynamic> infoMap = Map();
    infoMap["english_name"] = "Jane";
    infoMap["chinese_name"] = "简";
    infoMap["age"] = 18;

    var userinfoDataMeta = new UserinfoDataMeta(infoMap);
    expect(userinfoDataMeta.chineseName, "简");
    expect(userinfoDataMeta.englishName, "Jane");
    expect(userinfoDataMeta.age, 18);
  });
}
