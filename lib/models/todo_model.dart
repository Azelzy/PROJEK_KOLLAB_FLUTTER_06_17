class Todo {
  final String id;
  String judul;
  String deskripsi;
  String kategori; // sekolah, pekerjaan, pribadi
  bool selesai;

  Todo({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.kategori,
    this.selesai = false,
  });
}
