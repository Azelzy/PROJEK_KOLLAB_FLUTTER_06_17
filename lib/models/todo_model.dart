class Todo {
  String id;
  String judul;
  String deskripsi;
  String kategori;
  String tingkatKepentingan;
  bool selesai;

  Todo({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.kategori,
    required this.tingkatKepentingan,
    this.selesai = false,
  });

  // Convert Todo to Map untuk disimpan ke database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'judul': judul,
      'deskripsi': deskripsi,
      'kategori': kategori,
      'tingkatKepentingan': tingkatKepentingan,
      'selesai': selesai ? 1 : 0,
    };
  }

  // Convert Map dari database ke Todo object
  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as String,
      judul: map['judul'] as String,
      deskripsi: map['deskripsi'] as String,
      kategori: map['kategori'] as String,
      tingkatKepentingan: map['tingkatKepentingan'] as String,
      selesai: (map['selesai'] as int) == 1,
    );
  }

  // Copy with method (optional, berguna untuk update)
  Todo copyWith({
    String? id,
    String? judul,
    String? deskripsi,
    String? kategori,
    String? tingkatKepentingan,
    bool? selesai,
  }) {
    return Todo(
      id: id ?? this.id,
      judul: judul ?? this.judul,
      deskripsi: deskripsi ?? this.deskripsi,
      kategori: kategori ?? this.kategori,
      tingkatKepentingan: tingkatKepentingan ?? this.tingkatKepentingan,
      selesai: selesai ?? this.selesai,
    );
  }
}