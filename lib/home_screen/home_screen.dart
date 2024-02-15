import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post_get_api_example/services/Networks.dart';

import '../model/photos_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  Future<List<photoModel>> getPhtos()async{
    List<photoModel> photolist=[];
    NetworkHelper networkHelper=NetworkHelper(url: "https://jsonplaceholder.typicode.com/photos");
    var photojesondata= await networkHelper.getData();
    print(photojesondata);
    
    for (var item in photojesondata){
      photoModel home=photoModel.fromJson(item);
      photolist.add(home);
    }
    return photolist;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhtos(),
                builder: (context,snapshot){
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                      itemBuilder: (_,index){
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(snapshot.data![0].url!),
                        
                          ),
                          title: Text(snapshot.data![0].title!),
                          trailing: Text(snapshot.data![0].id.toString()),
                          subtitle: Text(snapshot.data![0].toString()),
                        
                        ),
                      );
            
                  });
                }
            ),
          )
          
        ],
      ),
    );
  }
}
