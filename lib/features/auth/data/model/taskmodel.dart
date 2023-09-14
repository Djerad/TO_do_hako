class Taskmodel {
  final String id;
  final String title;
  final String note;
  final String starttime;
  final String endtime;
  final bool iscompleted;
  final int color;

  Taskmodel({
    required this.id,
    required this.title,
    required this.note,
    required this.starttime,
    required this.endtime,
    required this.iscompleted,
    required this.color,
  });
  static List<Taskmodel> tasklist = [
    Taskmodel(
        id: "2",
        title: "java",
        note: "learn springboot",
        starttime: "09:33'",
        endtime: "10:11",
        iscompleted: true,
        color: 2),
    Taskmodel(
        id: "1",
        title: "flutter",
        note: "learn dart",
        starttime: "09:3'",
        endtime: "10:34",
        iscompleted: false,
        color: 1)
  ];
}
