import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_unit_test_with_mokito/userInfoService.dart';
import 'package:flutter_unit_test_with_mokito/httpClient.dart';

class MockClient extends Mock implements HttpClient {}

void main() {
  test('Class UserInfoService unit test', () async {
    final mockClient = MockClient();
    final mockHttpResponseStr = "{\"english_name\":\"Bob_mock\",\"chinese_name\":\"鲍勃_mock\",\"age\":250}";
    when(mockClient.getRequest(any)).thenAnswer((_) => new Future(() => mockHttpResponseStr));

    final userInfoService = UserInfoService.withMocks(mockClient);

    var userInfo = await userInfoService.getUserInfo("Jane");

    expect(userInfo.chineseName, "鲍勃_mock");
    expect(userInfo.englishName, "Bob_mock");
    expect(userInfo.age, 250);

  });
}
