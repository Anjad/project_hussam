import '../models/Collocation.dart';
import '../models/Post.dart';
import '../models/User.dart';

class Sample {
  static User yazan = User(
      name: "Yazan Al-hasson",
      username: "@turboyazan",
      followers: 400,
      following: 190,
      profilePicture: "assets/users/yaxan.jpg",
      collocation: [
        Collocation(
            name: "Photography",
            tags: ["HD Photos", "Weather", "Photography"],
            thumbnail: "assets/photos/one.jpg",
            posts: [
              Post(
                  location: "Amman, Jordan",
                  dateAgo: "3 min ago",
                  photos: [
                    'assets/photos/one.jpg',
                    'assets/photos/two.jpg',
                    'assets/photos/three.jpg',
                  ],
                  relatedPhotos: [],
                  user: User(
                      name: "name",
                      profilePicture: "profilePicture",
                      username: "username",
                      followers: 0,
                      following: 0,
                      collocation: [])),
              Post(
                  location: "Amman, Jordan",
                  dateAgo: "1 week ago",
                  photos: [
                    'assets/photos/six.jpg',
                    'assets/photos/eight.jpg',
                    'assets/photos/two.jpg',
                  ],
                  relatedPhotos: [],
                  user: User(
                      name: "name",
                      profilePicture: "profilePicture",
                      username: "username",
                      followers: 0,
                      following: 0,
                      collocation: []))
            ]),
        Collocation(
            name: "Photography",
            tags: ["HD Photos", "Weather", "Photography"],
            thumbnail: "assets/photos/five.jpg",
            posts: [
              Post(
                  location: "Amman, Jordan",
                  dateAgo: "7 min ago",
                  photos: [
                    'assets/photos/one.jpg',
                    'assets/photos/two.jpg',
                    'assets/photos/three.jpg',
                  ],
                  relatedPhotos: [],
                  user: User(
                      name: "name",
                      profilePicture: "profilePicture",
                      username: "username",
                      followers: 0,
                      following: 0,
                      collocation: [])),
              Post(
                  location: "Amman, Jordan",
                  dateAgo: "2 week ago",
                  photos: [
                    'assets/photos/six.jpg',
                    'assets/photos/eight.jpg',
                    'assets/photos/two.jpg',
                  ],
                  relatedPhotos: [],
                  user: User(
                      name: "name",
                      profilePicture: "profilePicture",
                      username: "username",
                      followers: 0,
                      following: 0,
                      collocation: []))
            ]),
      ]);

  static User adel = User(
      name: "Adel Nasim",
      username: "@adelnasim.ad",
      followers: 400,
      following: 190,
      profilePicture: "assets/users/adel.jpg",
      collocation: [
        Collocation(
            name: "Photography",
            tags: ["HD Photos", "Weather", "Photography"],
            thumbnail: "assets/photos/two.jpg",
            posts: [
              Post(
                  location: "Amman, Jordan",
                  dateAgo: "3 min ago",
                  photos: [
                    'assets/photos/five.jpg',
                    'assets/photos/six.jpg',
                    'assets/photos/seven.jpg',
                  ],
                  relatedPhotos: [],
                  user: User(
                      name: "name",
                      profilePicture: "profilePicture",
                      username: "username",
                      followers: 0,
                      following: 0,
                      collocation: [])),
              Post(
                  location: "Amman, Jordan",
                  dateAgo: "4 week ago",
                  photos: [
                    'assets/photos/six.jpg',
                    'assets/photos/eight.jpg',
                    'assets/photos/two.jpg',
                  ],
                  relatedPhotos: [],
                  user: User(
                      name: "name",
                      profilePicture: "profilePicture",
                      username: "username",
                      followers: 0,
                      following: 0,
                      collocation: []))
            ]),
      ]);

  static User anjad = User(
      name: "Anjad Khalaf",
      username: "@anjad.khalaf",
      followers: 400,
      following: 190,
      profilePicture: "assets/users/anjad.png",
      collocation: [
        Collocation(
            name: "Developer|Designer",
            tags: ["HD Photos", "Flutter", "Photography"],
            thumbnail: "assets/photos/two.jpg",
            posts: [
              Post(
                  location: "Amman, Jordan",
                  dateAgo: "31 min ago",
                  photos: [
                    'assets/photos/five.jpg',
                    'assets/photos/six.jpg',
                    'assets/photos/seven.jpg',
                  ],
                  relatedPhotos: [],
                  user: User(
                      name: "name",
                      profilePicture: "profilePicture",
                      username: "username",
                      followers: 0,
                      following: 0,
                      collocation: [])),
              Post(
                  location: "Amman, Jordan",
                  dateAgo: "4 week ago",
                  photos: [
                    'assets/photos/six.jpg',
                    'assets/photos/eight.jpg',
                    'assets/photos/two.jpg',
                  ],
                  relatedPhotos: [],
                  user: User(
                      name: "name",
                      profilePicture: "profilePicture",
                      username: "username",
                      followers: 0,
                      following: 0,
                      collocation: []))
            ]),
      ]);

  static User hussam = User(
      name: "Hussam General",
      username: "@general.hu",
      followers: 200,
      following: 44,
      profilePicture: "assets/users/hussam.jpg",
      collocation: [
        Collocation(
            name: "Photography",
            tags: ["HD Photos", "Weather", "Photography"],
            thumbnail: "assets/photos/two.jpg",
            posts: [
              Post(
                  location: "Amman, Jordan",
                  dateAgo: "3 min ago",
                  photos: [
                    'assets/photos/five.jpg',
                    'assets/photos/six.jpg',
                    'assets/photos/seven.jpg',
                  ],
                  relatedPhotos: [],
                  user: User(
                      name: "name",
                      profilePicture: "profilePicture",
                      username: "username",
                      followers: 0,
                      following: 0,
                      collocation: [])),
              Post(
                  location: "Amman, Jordan",
                  dateAgo: "4 week ago",
                  photos: [
                    'assets/photos/six.jpg',
                    'assets/photos/eight.jpg',
                    'assets/photos/two.jpg',
                  ],
                  relatedPhotos: [],
                  user: User(
                      name: "name",
                      profilePicture: "profilePicture",
                      username: "username",
                      followers: 0,
                      following: 0,
                      collocation: []))
            ]),
      ]);

  static User mohammad = User(
      name: "Mohammad Zoubi",
      username: "@mohammad.ada",
      followers: 800,
      following: 190,
      profilePicture: "assets/users/mohammad.jpg",
      collocation: [
        Collocation(
            name: "Photography",
            tags: ["HD Photos", "Weather", "Photography"],
            thumbnail: "assets/photos/two.jpg",
            posts: [
              Post(
                  location: "Amman, Jordan",
                  dateAgo: "3 min ago",
                  photos: [
                    'assets/photos/five.jpg',
                    'assets/photos/six.jpg',
                    'assets/photos/seven.jpg',
                  ],
                  relatedPhotos: [],
                  user: User(
                      name: "name",
                      profilePicture: "profilePicture",
                      username: "username",
                      followers: 0,
                      following: 0,
                      collocation: [])),
              Post(
                  location: "Amman, Jordan",
                  dateAgo: "4 week ago",
                  photos: [
                    'assets/photos/six.jpg',
                    'assets/photos/eight.jpg',
                    'assets/photos/two.jpg',
                  ],
                  relatedPhotos: [],
                  user: User(
                      name: "name",
                      profilePicture: "profilePicture",
                      username: "username",
                      followers: 0,
                      following: 0,
                      collocation: []))
            ]),
      ]);

  static User yaser = User(
      name: "Yaser Afanah",
      username: "@yaser.ad",
      followers: 650,
      following: 120,
      profilePicture: "assets/users/yasir.jpg",
      collocation: [
        Collocation(
            name: "Photography",
            tags: ["HD Photos", "Weather", "Photography"],
            thumbnail: "assets/photos/two.jpg",
            posts: [
              Post(
                  location: "Amman, Jordan",
                  dateAgo: "3 min ago",
                  photos: [
                    'assets/photos/five.jpg',
                    'assets/photos/six.jpg',
                    'assets/photos/seven.jpg',
                  ],
                  relatedPhotos: [],
                  user: User(
                      name: "name",
                      profilePicture: "profilePicture",
                      username: "username",
                      followers: 0,
                      following: 0,
                      collocation: [])),
              Post(
                  location: "Amman, Jordan",
                  dateAgo: "4 week ago",
                  photos: [
                    'assets/photos/six.jpg',
                    'assets/photos/eight.jpg',
                    'assets/photos/two.jpg',
                  ],
                  relatedPhotos: [],
                  user: User(
                      name: "name",
                      profilePicture: "profilePicture",
                      username: "username",
                      followers: 0,
                      following: 0,
                      collocation: []))
            ]),
      ]);

  static Post postOne = Post(
      user: yazan,
      location: "Amman, Jordan",
      dateAgo: "5 min ago",
      photos: [
        'assets/photos/one.jpg',
        'assets/photos/two.jpg',
        'assets/photos/three.jpg'
      ],
      relatedPhotos: [
        'assets/photos/four.jpg',
        'assets/photos/five.jpg',
        'assets/photos/six.jpg',
        'assets/photos/seven.jpg',
        'assets/photos/eight.jpg'
      ]);

  static Post postTwo = Post(
      user: adel,
      location: "Amman, Jordan",
      dateAgo: "10 min ago",
      photos: [
        'assets/photos/four.jpg',
        'assets/photos/five.jpg',
        'assets/photos/six.jpg',
      ],
      relatedPhotos: [
        'assets/photos/one.jpg',
        'assets/photos/two.jpg',
        'assets/photos/three.jpg',
        'assets/photos/four.jpg',
        'assets/photos/five.jpg'
      ]);
}
