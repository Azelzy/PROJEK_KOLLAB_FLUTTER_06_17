class Todo {
  final String id;
  String judul;
  String deskripsi;
  String kategori; // work, personal, study
  String tingkatKepentingan; // low, normal, high, urgent
  bool selesai;

  Todo({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.kategori,
    required this.tingkatKepentingan,
    this.selesai = false,
  });
}