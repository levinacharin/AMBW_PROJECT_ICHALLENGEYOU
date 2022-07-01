//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';

//CollectionReference tblCatatan = FirebaseFirestore.instance.collection("tblCatatan");
CollectionReference listuser = FirebaseFirestore.instance.collection("User");
CollectionReference listchallenge = FirebaseFirestore.instance.collection("challenges");
//DocumentReference 


class Database {
  //baca data
  static Stream<QuerySnapshot> getlistchallenge(String email, String idchall) {
    return listuser
    .doc(email)
    //.where(document,isEqualTo: email)
    .collection('userchallenge')
    .where("idchallenge",isEqualTo: idchall)
    .snapshots();

    
    
    // if(email==""){
    //   return listuser.snapshots();
    // }else{
    //   return listuser
    //   .listchallenge
    //   //.orderBy("judulCat")
    //   //.startAt([judul]).endAt([judul+'\uf8ff'])
    //   .snapshots();
    // }
    
  }

  //buat update klo dah di klik done
  static Future<void> ubahData(String email, String namadocument) async{
    listuser
      .doc(email)
      .collection("userchallenge")
      .doc(namadocument)
      .update({'status':"done"})
      .catchError((e)=> print(e));
  }

  //update ganti hari
  static Future<void> gantihari(String email) async{
    listuser
      .doc(email)
      .collection("userchallenge")
      .doc()
      .update({'status':"notyet"})
      .catchError((e)=> print(e));
  }


  

  // static Stream<QuerySnapshot> getdetailchallenge(String email) {
  //   //Stream<QuerySnapshot<Object?>> listchalname = Database.getlistchallenge('levinacharin7@gmail.com');

  //   return listuser
  //   .doc("levinacharin7@gmail.com")
  //   //.where(document,isEqualTo: email)
  //   .collection('userchallenge')
  //   .snapshots();
    
  //   // if(email==""){
  //   //   return listuser.snapshots();
  //   // }else{
  //   //   return listuser
  //   //   .listchallenge
  //   //   //.orderBy("judulCat")
  //   //   //.startAt([judul]).endAt([judul+'\uf8ff'])
  //   //   .snapshots();
  //   // }
    
  // }

  //add data
  // static Future<void> tambahData({required itemCatatan item}) async {
  //   DocumentReference docRef = tblCatatan.doc(item.itemJudul);
    
  //   await docRef
  //   .set(item.toJson())
  //   .whenComplete(() => print("data berhasil diinput"))
  //   .catchError((e) => print(e));
  // }

  

  // static Future<void> hapusData({required String judulhapus}) async{
  //   DocumentReference docRef = tblCatatan.doc(judulhapus);
  //   await docRef
  //   .delete()
  //   .whenComplete(() => print("data berhasil dihapus"))
  //   .catchError((e)=>print(e));
  // }
}