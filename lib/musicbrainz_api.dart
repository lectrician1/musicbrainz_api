@JS('musicbrainz-api')
library musicbrainz_api;

// import 'package:meta/meta.dart';
import 'package:js/js.dart';

@JS()
class MusicBrainzApi {
  external factory MusicBrainzApi(Map config);
  external dynamic getEntity(String entity, String mbdi);
  external dynamic getArea(String mbdi);
  external dynamic getArtist(String mbdi);
  external dynamic getRecording(String mbdi);
}
