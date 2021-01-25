class Task {
  String title;
  String contents;
  List<String> images = [];
  List<String> dates;

  Task({this.title, this.contents, this.images, this.dates});
}

final Task tsk1 = Task(title: "수지", contents: "예쁘다", images: ['suzi.jpg'], dates: ['January', '25', '2021']);
final Task tsk2 = Task(title: "아이유", contents: "예쁘다", images: ['iu.jpg'], dates: ['January', '25', '2021']);
final Task tsk3 = Task(title: "우기", contents: "귀엽다", images: ['yuqi.jpg'], dates: ['January', '25', '2021']);
final Task tsk4 = Task(title: "izone.jpg", contents: "shot take a panorama~~", images: ['izone.jpg'],dates: ['January', '25', '2021']);
final Task tsk5 = Task(title: "good", contents: "nice~~", dates: ['January', '25', '2021']);
final Task tsk6 = Task(title: "하루에 하나씩", contents: "좋은 디자인이 안떠올라~", dates: ['January', '25', '2021']);
final Task tsk7 = Task(title: "좋은 디자인", contents: "어디없나?~~", dates: ['January', '25', '2021']);

List<Task> Tasks = [tsk1, tsk2, tsk3, tsk4, tsk5, tsk6, tsk7];