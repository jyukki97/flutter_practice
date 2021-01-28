class Book {
  String name;
  String author;
  int grade;
  String image;
  double page;

  Book({this.name, this.author, this.grade, this.image, this.page});
}

Book test1 = Book(name: "코스모스", author: "칼 세이건", grade: 4, image: "content0.jpg", page: 80);
Book test2 = Book(name: "군주론", author: "니콜로 마키아벨리", grade: 5, image: "content1.jpg");
Book test3 = Book(name: "호밀밭의 파수꾼", author: "제롬 데이비드 샐린저", grade: 4, image: "content2.jpg");
Book test4 = Book(name: "정의란 무엇인가", author: "마이클 샌델", grade: 4, image: "content3.jpg");
Book test5 = Book(name: "이기적 유전자", author: "리처드 도킨스", grade: 5, image: "content4.jpg", page: 100);
Book test6 = Book(name: "총, 균, 쇠", author: "재러드 다이아몬드", grade: 4, image: "content5.jpg");

List<Book> booklist = [test1, test2, test3, test4, test5, test6];

List<Book> mybook = [test1, test5];

List<Book> wishlist = [test1, test2, test3, test4,];