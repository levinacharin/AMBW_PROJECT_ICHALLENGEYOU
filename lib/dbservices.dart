import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ichallengeyouapp/dataclass.dart';
CollectionReference tblCatatan = FirebaseFirestore.instance.collection("tabelCatatan");
class Database {
  //baca data
  static Stream<QuerySnapshot> getData(String judul) {
    if(judul==""){
      return tblCatatan.snapshots();
    }else{
      return tblCatatan
      .orderBy("judulCat")
      .startAt([judul]).endAt([judul+'\uf8ff'])
      .snapshots();
    }
    
  }

  //add data
  static Future<void> tambahData({required itemCatatan item}) async {
    DocumentReference docRef = tblCatatan.doc(item.itemJudul);
    
    await docRef
    .set(item.toJson())
    .whenComplete(() => print("data berhasil diinput"))
    .catchError((e) => print(e));
  }

  //buat update
  static Future<void> ubahData({required itemCatatan item}) async{
    DocumentReference docRef = tblCatatan.doc(item.itemJudul);
    await docRef
    .update(item.toJson())
    .whenComplete(() => print("data berhasil diubah"))
    .catchError((e)=> print(e));
  }

  static Future<void> hapusData({required String judulhapus}) async{
    DocumentReference docRef = tblCatatan.doc(judulhapus);
    await docRef
    .delete()
    .whenComplete(() => print("data berhasil dihapus"))
    .catchError((e)=>print(e));
  }
}