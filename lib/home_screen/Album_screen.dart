import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:post_get_api_example/services/Networks.dart';

import '../model/album_model.dart';


class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  Future<List<AlbumModel>> getAlbum() async{
    List<AlbumModel> albumlist=[];
    NetworkHelper networkHelper=NetworkHelper(url: "https://jsonplaceholder.typicode.com/albums");
    var checking= await networkHelper.getData();
    print(checking);

    for (var items in checking){
      AlbumModel albumModel=AlbumModel.fromJson(items);
      albumlist.add(albumModel);

    }
    return albumlist;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder (
                future: getAlbum(),
                builder: (_,snapshot){
              return ListView.builder(
                itemCount:  snapshot.data!.length,
                  itemBuilder: (_,index){
                return Card(
                  child: ListTile(
                  
                    title: Text(snapshot.data![index].title!),
                    leading: Text(snapshot.data![index].userId.toString()),
                    subtitle: Text(snapshot.data![index].id.toString()),
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
