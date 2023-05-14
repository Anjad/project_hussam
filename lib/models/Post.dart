
import 'User.dart';

class Post {
  final User user;
  final String location;
  final String dateAgo;
  final List<String> photos;
  final List<String> relatedPhotos;

  Post({required this.location,required this.dateAgo,required this.photos,required this.relatedPhotos,required this.user, });
}