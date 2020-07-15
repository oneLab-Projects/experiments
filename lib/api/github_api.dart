

import 'dart:convert';
import 'dart:io';

import 'package:onelab_experiments/api/github_user.dart';

import 'api_client.dart';
import 'package:http/http.dart' as http;

class GithubApiClient extends ApiClient
{
  Future<GithubUser> getUserByID(int id) async {
    final String url = "https://api.github.com/user/" + id.toString();

    final http.Response result = await http.get(url);
    if (result.statusCode != 200)
      throw "Fuck GitHub!";
    return GithubUser.fromJson(jsonDecode(result.body));
  }

  Future<List<GithubUser>> getUsersByID(List<int> idList) async {
    List<GithubUser> users = List<GithubUser>();
    await Future.forEach(
      idList, 
      (id) async => users.add(await getUserByID(id))
    );
    return users;
  }
} 