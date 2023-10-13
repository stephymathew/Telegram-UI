

import 'package:flutter/material.dart';
import 'package:telegram_project/screens/home.dart';


// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
   ChatScreen({super.key, required this.index});
  final int index;
  TextEditingController  _messageController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Row(
          children: [
             CircleAvatar(backgroundImage: AssetImage(images[index])),
            Text(names[index]),

          ],
        ),
         actions: const [Icon(Icons.more_vert)],
        
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            
            Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    color: const Color.fromARGB(255, 67, 145, 190),
                    child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                
                const Icon(Icons.emoji_emotions),
                const SizedBox(width: 10,),
                Expanded(child:TextField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                    hintText: 'message',
                    border: InputBorder.none, )
                   
                  ),

                ),
                const Icon(Icons.mic),
              ]
            ),
                ),
           
          ],
        ),
    );
  }
}
