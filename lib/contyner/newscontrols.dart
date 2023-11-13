import 'dart:convert';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:wetherapp/model/newsmodel.dart';


class NewsController extends GetxController{
  getData() async{
    final url = Uri.parse("https://newsapi.org/v2/top-headlines?country=sa&apiKey=4a49dfc554394980b4be86002576d5fe");
http.Response response = await http.get(url);
if(response.statusCode == 200)
{
 try{
   return Article.fromJson(jsonDecode(response.body));
 }catch(e){
   Get.snackbar("error",e.toString());
 }
}
  }
}