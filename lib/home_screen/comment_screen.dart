import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post_get_api_example/services/Networks.dart';

import '../model/comment_model.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  Future<List<CommentModel>> getComment()async{
    List<CommentModel> commentlist=[];
    NetworkHelper networkHelper=NetworkHelper(url: "https://jsonplaceholder.typicode.com/comments");
    var commentChecking= await networkHelper.getData();
    print(commentChecking);
    for (var item in commentChecking){
      CommentModel commentModel=CommentModel.fromJson(item);
      commentlist.add(commentModel);

    }
    return commentlist;

    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(future: getComment(), builder: (_,snapshot){
              return ListView.builder(
                itemCount: snapshot.data!.length,
                  itemBuilder: (_,index){
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data![index].name!),
                    subtitle: Text(snapshot.data![index].body!),
                    trailing:  Text(snapshot.data![index].email!),
                    leading: Text(snapshot.data![index].id.toString()),
                    
                  ),
                );
              });
            }),
          )
          
        ],
      ),
    );
  }
}
