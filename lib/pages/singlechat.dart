import 'package:chatapp/components/message_box.dart';
import 'package:chatapp/components/textbox.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SingleChatPage extends StatefulWidget {
  final String receiverMail;
  final String receiverID;
  SingleChatPage(
      {super.key, required this.receiverMail, required this.receiverID});

  @override
  State<SingleChatPage> createState() => _SingleChatPageState();
}

class _SingleChatPageState extends State<SingleChatPage> {
  final TextEditingController _messageController = TextEditingController();

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  FocusNode myFocustNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocustNode.addListener(() {
      if (myFocustNode.hasFocus) {
        Future.delayed(
          const Duration(milliseconds: 500),
          () => scrollDown(),
        );
      }
    });

    Future.delayed(
      const Duration(milliseconds: 500),
      () => scrollDown(),
    );
  }

  @override
  void dispose() {
    myFocustNode.dispose();
    _messageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  //scroll controller
  final ScrollController _scrollController = ScrollController();

  void scrollDown() async {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverID, _messageController.text);
      _messageController.clear();
    }
    scrollDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverMail),
      ),
      body: Column(children: [
        Expanded(
          child: _buildMessageList(),
        ),
        _buildUserInput(),
      ]),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUserID();
    return StreamBuilder(
        stream: _chatService.getMessages(widget.receiverID, senderID),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          }

          //loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading...');
          }

          //return list view
          return ListView(
            controller: _scrollController,
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList(),
          );
        });
  }

  //build message item
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isCurrentUser = data['senderID'] == _authService.getCurrentUserID();

    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
        margin: EdgeInsets.all(5),
        alignment: alignment,
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            MessageBox(isCurrentUser: isCurrentUser, message: data["message"]),
          ],
        ));
  }

  //build message input
  Widget _buildUserInput() {
    return Row(
      children: [
        //textfield
        Expanded(
            child: TextBox(
                focusNode: myFocustNode,
                controller: _messageController,
                obscureText: false,
                hintText: "Type a message")),

        //send button
        IconButton(
          onPressed: sendMessage,
          icon: Icon(Icons.arrow_upward),
        )
      ],
    );
  }
}
