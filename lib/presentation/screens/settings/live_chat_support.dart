import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportapp/core/app_colors.dart';

import 'widgets/message_bubble.dart';

class LiveSupportChat extends StatefulWidget {
  const LiveSupportChat({super.key});

  @override
  LiveSupportChatState createState() => LiveSupportChatState();
}

class LiveSupportChatState extends State<LiveSupportChat> {
  List<String> messages = [
    "Hello! How can we assist you today?",
    "Sure, I'll be happy to help.",
  ];

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 5,
            width: 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.seGreen),
            child: const Center(
                child: Icon(
              Icons.arrow_back_ios,
              size: 15,
            )),
          ),
        ),
        title: Text(
          'Live Chat Support',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'ClashDisplay',
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(
                  message: messages[index],
                  isSentBySupport: index % 2 == 0 ? false : true,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: AppColors.seGreen),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextField(
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodySmall!.color),
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                              color: Theme.of(context).highlightColor),
                          hintText: 'Type your message...',
                          border: InputBorder.none, // Remove TextField border
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                IconButton(
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      setState(() {
                        messages.add(_messageController.text);
                        _messageController.clear();
                      });
                    }
                  },
                  icon: Icon(
                    Icons.send_rounded,
                    color: AppColors.seGreen,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
