library musicbrainz_api;

import 'package:http/http.dart';
import 'package:http/retry.dart';
import 'dart:convert';

/// Autheticatation class to use the MusicBrainz API.
class Authentication {
  Authentication({
    required this.name,
    required this.version,
    this.contact,
    this.username,
    this.password,
  });

  /// The name of the application.
  final String name;

  /// The version of the application.
  final String version;

  /// The contact address to reach the authors of the application.
  /// Typically an email or website url.
  final String? contact;

  /// The MusicBrainz username of the bot account for the application.
  final String? username;

  /// The MusicBrainz password of the bot account for the application.
  final String? password;
}

/// Main class to use the MusicBrainz API
class MusicBrainzApi {
  MusicBrainzApi(this.authentication) : client = RetryClient(Client());

  final RetryClient client;
  final Authentication authentication;

  Uri _url(String path, [Map<String, String>? parameters]) =>
      Uri.https('musicbrainz.org', '/ws/2' + path, parameters);

  /// Interface with the API
  Future<Map> getApi(String path,
      [Map<String, String>? parameters]) async {
    return jsonDecode((await client.get(_url(path, parameters), headers: {
      'User-Agent':
          '${authentication.name}/${authentication.version} ( {$authentication.email} )',
      'Accept': 'application/json'
    })).body);
  }

  // Future<Request> postApi() async {
  //   return await client.post(_url);
  // }

  /// Get entity of a type.
  Future<Map> getEntity(String entity, String mbdi) async => await getApi('/$entity/$mbdi');

  getArea(String mbdi) async => getEntity('', mbdi);
  // getArtist(String mbdi) async => getEntity('', mbdi);
  // getRecording(String mbdi) async => getEntity('', mbdi);
  // getRelease(String mbdi) async => getEntity('', mbdi);
  // getReleaseGroup(String mbdi) async => getEntity('', mbdi);
  // getWork(String mbdi) async => getEntity('', mbdi);

  //search(String entity);
}
