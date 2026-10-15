import 'package:chat_ui/features/home/data/model/chat_item_model.dart';
import 'package:chat_ui/features/home/ui/widgets/chat_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<ChatItemModel> chatItem = [
    ChatItemModel(
      image: 'assets/images/profile1.jpg',
      text: 'Jenny ❤️',
      subText: 'You reacted 😘 to "Thats good advice, Marty"',
    ),
    ChatItemModel(
      image: 'assets/images/profile2.png',
      text: 'Dad ❤️',
      subText: 'I mean he wrecked it! 😭',
    ),
    ChatItemModel(
      image: 'assets/images/profile3.png',
      text: 'Mom ❤️',
      subText: 'Mom is typing...',
    ),
    ChatItemModel(
      image: 'assets/images/profile4.jpg',
      text: 'Brother ❤️',
      subText: 'Say hi to your mom for me.',
    ),
    ChatItemModel(
      image: 'assets/images/profile5.jpg',
      text: 'Sister ❤️',
      subText: 'Thanks bro!',
    ),  ChatItemModel(
      image: 'assets/images/profile1.jpg',
      text: 'Jenny ❤️',
      subText: 'You reacted 😘 to "Thats good advice, Marty"',
    ),
    ChatItemModel(
      image: 'assets/images/profile2.png',
      text: 'Dad ❤️',
      subText: 'I mean he wrecked it! 😭',
    ),
    ChatItemModel(
      image: 'assets/images/profile3.png',
      text: 'Mom ❤️',
      subText: 'Mom is typing...',
    ),
    ChatItemModel(
      image: 'assets/images/profile4.jpg',
      text: 'Brother ❤️',
      subText: 'Say hi to your mom for me.',
    ),
    ChatItemModel(
      image: 'assets/images/profile5.jpg',
      text: 'Sister ❤️',
      subText: 'Thanks bro!',
    ),  ChatItemModel(
      image: 'assets/images/profile1.jpg',
      text: 'Jenny ❤️',
      subText: 'You reacted 😘 to "Thats good advice, Marty"',
    ),
    ChatItemModel(
      image: 'assets/images/profile2.png',
      text: 'Dad ❤️',
      subText: 'I mean he wrecked it! 😭',
    ),
    ChatItemModel(
      image: 'assets/images/profile3.png',
      text: 'Mom ❤️',
      subText: 'Mom is typing...',
    ),
    ChatItemModel(
      image: 'assets/images/profile4.jpg',
      text: 'Brother ❤️',
      subText: 'Say hi to your mom for me.',
    ),
    ChatItemModel(
      image: 'assets/images/profile5.jpg',
      text: 'Sister ❤️',
      subText: 'Thanks bro!',
    ),  ChatItemModel(
      image: 'assets/images/profile1.jpg',
      text: 'Jenny ❤️',
      subText: 'You reacted 😘 to "Thats good advice, Marty"',
    ),
    ChatItemModel(
      image: 'assets/images/profile2.png',
      text: 'Dad ❤️',
      subText: 'I mean he wrecked it! 😭',
    ),
    ChatItemModel(
      image: 'assets/images/profile3.png',
      text: 'Mom ❤️',
      subText: 'Mom is typing...',
    ),
    ChatItemModel(
      image: 'assets/images/profile4.jpg',
      text: 'Brother ❤️',
      subText: 'Say hi to your mom for me.',
    ),
    ChatItemModel(
      image: 'assets/images/profile5.jpg',
      text: 'Sister ❤️',
      subText: 'Thanks bro!',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.camera_alt_outlined),
          Gap(8),
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.green,
            child: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Chats",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: chatItem.length,
                  itemBuilder: (context, index) {
                    
                    return Column(
                      children: [
                        ChatItemWidget(
                          image: chatItem[index].image,
                          text: chatItem[index].text,
                          subText: chatItem[index].subText,
                        ),
                        Gap(10),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
