class Todo {
  final String image, title, body, time;
  final int state;

  Todo({
    this.image,
    this.title,
    this.body,
    this.time,
    this.state
  });
}

List<Todo> todo_data = [
  Todo(
    image: '',
    title: 'gooddlskdlskdlskdlskdldflskflsdkf;lskdf;lskdlskdlskdl',
    body: 'body 1',
    time: '',
    state: 0
  ),
  Todo(
    image: '',
    title: 'good3',
    body: 'body 2',
    time: '',
      state: 0
  ),
  Todo(
    image: '',
    title: 'good4',
    body: 'body 3',
    time: '',
      state: 0
  ),
];

List<Todo> ing_data = [
  Todo(
    image: '',
    title: '기능 만들기',
    body: 'body 1',
    time: '',
      state: 1,
  ),
  Todo(
    image: '',
    title: '디자인 꾸미기',
    body: 'body 2',
    time: '',
      state: 1
  ),
  Todo(
    image: '',
    title: '다듬기',
    body: 'body 3',
    time: '',
      state: 1
  ),
];

List<Todo> done_data = [
  Todo(
    image: '',
    title: '뼈대 만들기',
    body: 'body 1',
    time: '',
      state: 2
  ),
  Todo(
    image: '',
    title: '아이디어',
    body: 'body 2',
    time: '',
      state: 2
  ),
];