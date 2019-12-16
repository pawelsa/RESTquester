// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:restquester/requester.dart';

import 'model.dart';

void main() {
  test('Test request', () async {
    RequestBuilder.baseUrl = 'https://api.github.com/';
    final Response response = await RequestBuilder.get('orgs/octokit')
        .withMapper((map) => Response.fromJson(map))
        .execute();
    print("${response.login}");
    assert(response != null);
  });
}

class LoginBody {
  String login;
  String password;
  String clientId;

  LoginBody({this.login, this.password, this.clientId});

  LoginBody.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    password = json['password'];
    clientId = json['clientId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['password'] = this.password;
    data['clientId'] = this.clientId;
    return data;
  }
}