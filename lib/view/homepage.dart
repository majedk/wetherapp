import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetherapp/contyner/newscontrols.dart';



import '../model/newsmodel.dart';

class HomPage extends GetWidget{
  @override
  NewsController controller = Get.put(NewsController());

  HomPage({super.key});
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: const Text('News app'),
     ),
     body: FutureBuilder(
       future: controller.getData(),
       builder: (context,AsyncSnapshot snapshot)
       {
         Article data = snapshot.data;
        if(snapshot.hasData){
          return ListView.builder(
              itemCount: data.article.lenth,                      //data.Article.length,
              itemBuilder: (context,int index)
              {
                return Card(
                  elevation: 10,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Image.network(data.article[index].urlToImage.toString()),
                      Text(data.article.[index].title),
                      Text(data.article.[index].descriptiion),
                    ],
                  ),
                );
              }
          );
        }
        else {
          return const Center(child: CircularProgressIndicator());
        }
       }),
   );
  }
  
}