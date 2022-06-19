class itemCatatan{
  final String itemJudul;
  final String itemIisi;

  itemCatatan({required this.itemJudul, required this.itemIisi});

  //fungsi merubah ke json
  Map<String, dynamic> toJson(){
    return {
      "judulCat" : itemJudul,
      "isiCat" : itemIisi
    };
  }

  //rubah dari json ke dataclass yg ada
  factory itemCatatan.fromJson(Map<String, dynamic> json){
    return itemCatatan(itemJudul: json['judulCat'], itemIisi: json['isiCat']);
  }

}