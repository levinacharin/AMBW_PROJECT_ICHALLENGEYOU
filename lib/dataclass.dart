class itemChallenge{
  final String dc_idchallenge;
  final String dc_imgchallenge;
  final String dc_challengedesc;
  final String dc_namadocument;


  itemChallenge({
    required this.dc_idchallenge, 
    required this.dc_imgchallenge,
    required this.dc_challengedesc,
    required this.dc_namadocument
    });

  //fungsi merubah ke json
  // Map<String, dynamic> toJson(){
  //   return {
  //     "judulCat" : itemJudul,
  //     "isiCat" : itemIisi
  //   };
  // }

  //rubah dari json ke dataclass yg ada
  factory itemChallenge.fromJson(Map<String, dynamic> json){
    return itemChallenge(
      dc_idchallenge: json['idchallenge'], 
      dc_imgchallenge: json['imgchallenge'],
      dc_challengedesc: json['challengedesc'],
      dc_namadocument: json['namadocument'],

      );
  }

}


class itemQuotes {
  final String itemId;
  final String itemvalue;

  itemQuotes({required this.itemId, required this.itemvalue});

  // to json
  Map<String, dynamic> toJson() {
    return {
      "idQuotes" : itemId,
      "value" : itemvalue
    };
  }

   // from json
  factory itemQuotes.fromJson(Map<String, dynamic> json ) {
    return itemQuotes(
      itemId: json['idQuotes'], 
      itemvalue: json['value']
    );
  }
}