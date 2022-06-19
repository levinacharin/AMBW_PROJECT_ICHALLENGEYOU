import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dataclass.dart';
import 'dbservices.dart';

class detData extends StatefulWidget {
  // data yg terkirim dr main
  final itemCatatan? dataDet;

  const detData({Key? key, this.dataDet}) : super(key: key);

  @override
  State<detData> createState() => _detDataState();
}

class _detDataState extends State<detData> {
  final _ctrJudul = TextEditingController();
  final _ctrIsi = TextEditingController();
  bool _isDisabled = false;
  
  @override
  void dispose(){
    _ctrJudul.dispose();
    _ctrIsi.dispose();
    super.dispose();
  }

  @override
  //init state untuk tahu dia dari add atau edit
  void initState(){
    _ctrJudul.text = widget.dataDet?.itemJudul ?? "";
    _ctrIsi.text = widget.dataDet?.itemIisi ?? "";
    //klo null, maka diisi string kosong
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //pengecekan dia edit atau add by boolean
    if (widget.dataDet == null){
      _isDisabled = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Data Note"),
      ),
      body: Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _ctrJudul,
              enabled: _isDisabled,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Masukkan Judul Note",
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              controller: _ctrIsi,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Masukkan Isi Note",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final dt = itemCatatan(itemJudul: _ctrJudul.text, itemIisi: _ctrIsi.text);
                Database.tambahData(item: dt);
                Navigator.pop(context);
              }, 
              child: Text("Simpan Data"))
          ],
        ),
      ),
    );
  }
}
