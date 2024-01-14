import 'dart:convert';

class ProductX {
  final String nama;
  final String id;
  final String createdAt;
  final String imageUrl;
  final int harga;
  final int stok;
  ProductX({
    this.nama = '',
    this.id = '',
    this.createdAt = '',
    this.imageUrl = '',
    this.harga = 0,
    this.stok = 0,
  });

  ProductX copyWith({
    String? nama,
    String? id,
    String? createdAt,
    String? imageUrl,
    int? harga,
    int? stok,
  }) {
    return ProductX(
      nama: nama ?? this.nama,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      imageUrl: imageUrl ?? this.imageUrl,
      harga: harga ?? this.harga,
      stok: stok ?? this.stok,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'nama': nama});
    result.addAll({'id': id});
    result.addAll({'created_at': createdAt});
    result.addAll({'image_url': imageUrl});
    result.addAll({'harga': harga});
    result.addAll({'stok': stok});

    return result;
  }

  factory ProductX.fromMap(Map<String, dynamic> map) {
    return ProductX(
      nama: map['nama'] ?? '',
      id: map['id'] ?? '',
      createdAt: map['created_at'] ?? '',
      imageUrl: map['image_url'] ?? '',
      harga: map['harga']?.toInt() ?? 0,
      stok: map['stok']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductX.fromJson(String source) => ProductX.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductX(nama: $nama, id: $id, createdAt: $createdAt, imageUrl: $imageUrl, harga: $harga, stok: $stok)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductX &&
        other.nama == nama &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.imageUrl == imageUrl &&
        other.harga == harga &&
        other.stok == stok;
  }

  @override
  int get hashCode {
    return nama.hashCode ^ id.hashCode ^ createdAt.hashCode ^ imageUrl.hashCode ^ harga.hashCode ^ stok.hashCode;
  }
}
