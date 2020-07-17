import 'dart:convert';
import 'dart:io' show HttpStatus;

import 'package:http/http.dart' as http;

import 'api_client.dart';
import 'github_user.dart';

class GithubApiClient extends ApiClient {
  Future<GithubUser> getUserByID(int id) async {
    final result = await http.get('https://api.github.com/user/$id');
    assert(result.statusCode == HttpStatus.ok);

    return GithubUser.fromJson(
      jsonDecode(result.body),
    );
  }

  Future<List<GithubUser>> getUsersByIDs(List<int> ids) async {
    return await Future.wait(
      ids.map(getUserByID),
    );
  }
}
