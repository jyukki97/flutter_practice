class Post {
  final String title, subTitle, imgName, description, month;
  final int day, year;

  Post({this.title, this.subTitle, this.imgName, this.description, this.month, this.day, this.year});
}

List<Post> samplePosts = [
  Post(
      title: "Welcome to Striped",
      subTitle: "A free, fully responsive HTML5 site template by HTML5 UP",
      imgName: "assets/images/pic01.jpg",
      description: '''Hello! You're looking at Striped, a fully responsive HTML5 site template designed by AJ for HTML5 UP It features a clean, minimalistic design, styling for all basic page elements (including blockquotes, tables and lists), a repositionable sidebar (left or right), and HTML5/CSS3 code designed for quick and easy customization (see code comments for details).

Striped is released for free under the Creative Commons Attribution license so feel free to use it for personal projects or even commercial ones – just be sure to credit HTML5 UP for the design. If you like what you see here, be sure to check out HTML5 UP for more cool designs or follow me on Twitter for new releases and updates.
      ''',
    month: "Jul",
    day: 14,
    year: 2014
  ),
  Post(
      title: "Lorem ipsum dolor sit amet",
      subTitle: "Feugiat interdum sed commodo ipsum consequat dolor nullam metus",
      imgName: "assets/images/pic02.jpg",
      description: "Quisque vel sapien sit amet tellus elementum ultricies. Nunc vel orci turpis. Donec id malesuada metus. Nunc nulla velit, fermentum quis interdum quis, tate etiam commodo lorem ipsum dolor sit amet dolore. Quisque vel sapien sit amet tellus elementum ultricies. Nunc vel orci turpis. Donec id malesuada metus. Nunc nulla velit, fermentum quis interdum quis, convallis eu sapien. Integer sed ipsum ante.",
      month: "Jul",
      day: 8,
      year: 2014
  ),
];