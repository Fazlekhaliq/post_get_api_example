import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper{
  final String url;
  NetworkHelper({
    required this.url,
});
Future<dynamic> getData()async{
  http.Response response= await http.get(Uri.parse(url));
if (response.statusCode==200){
var data= jsonDecode(response.body);
return data;
}else{
  return print("api is wrong");
}


}
}