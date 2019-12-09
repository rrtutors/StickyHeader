import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:url_launcher/url_launcher.dart';

import 'contact.dart';
class MyStickHeader extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyStickyHeaderState();
  }



}
class MyStickyHeaderState extends State<MyStickHeader>
{
  Map<String,List<Contact>>hm;
  List<String>alphabets;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hm=new Map();
    alphabets=new List();
    alphabets.add("A");
    alphabets.add("B");
    alphabets.add("C");
    alphabets.add("D");
    alphabets.add("E");
    alphabets.add("F");
    alphabets.add("G");
    alphabets.add("H");
    alphabets.add("I");
    alphabets.add("J");
    alphabets.add("K");
    alphabets.add("L");
    alphabets.add("M");
    alphabets.add("N");
    alphabets.add("O");
    alphabets.add("P");
    alphabets.add("Q");
    alphabets.add("R");
    alphabets.add("S");
    alphabets.add("T");
    alphabets.add("U");
    alphabets.add("V");
    alphabets.add("W");
    alphabets.add("X");
    alphabets.add("Y");
    alphabets.add("Z");
    for(var a=0;a<alphabets.length;a++)
      {
        List<Contact>names=List();
        for(var k=1;k<=5;k++)
          {

            names.add(Contact(alphabets[a]+"$k"+ " Name","$k$k$k$k$k$k$k$k$k$k"));
          }

          hm[alphabets[a]]= names;
      }
  }
  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Sticky Header"),
      ),
      backgroundColor: Colors.grey,
      body: ListView.builder(
          itemCount: hm.length,
          itemBuilder: (ctx,index){
        return StickyHeader(header: Container(
          width: double.infinity,

          decoration: new BoxDecoration(
              color: Colors.deepPurple,

          ),
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(alphabets[index],style: TextStyle(color: Colors.white,fontSize: 20),),
          ),), content: Container(
          child: Center(
            child: Column(
              children: getNames(index),
            ),
          ),
        ));
      }),
    );
  }


 List<Widget> getNames(index)
  {
    List<Widget>listNames=List();
    List<Contact>namesString=hm[alphabets[index]];
    for(var k=0;k<namesString.length;k++)
      {

        listNames.add(Card(
          child: InkWell(
            onTap: (){
              launch("tel:"+namesString[k].phone);
            },
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(namesString[k].name,style: TextStyle(fontSize: 16),),
                  SizedBox(height: 10,),
                  Row( children: <Widget>[Text(namesString[k].phone),Spacer(),Icon(Icons.phone,color: Colors.green,)],),
                ],
              ),
            ),
          ),
        ));
      }
  return listNames;
  }
}