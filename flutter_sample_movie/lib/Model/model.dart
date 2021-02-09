class Category{
  final genre;
  bool selected = false;

  Category({this.genre});
}

List<Category> category = [
  Category(genre: 'COMEDY'),
  Category(genre: 'MYSTERY'),
  Category(genre: 'THRILLER'),
  Category(genre: 'ACTION'),
  Category(genre: 'FANTASY'),
  Category(genre: 'DRAMA'),
];

Set<String> searched = Set<String>();

Map<String, dynamic> likeMovie = Map<String, dynamic>();

Map<String, dynamic> bookMark = Map<String, dynamic>();

