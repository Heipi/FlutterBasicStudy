import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:light/flashchat/constants.dart';

final _firestore = Firestore.instance;
late FirebaseUser loggedUser;

class ChatScreen extends StatefulWidget {
  static const String id = "chat_screen";
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;

  late String messageText;
  final messageTextController = TextEditingController();
  FocusNode _contentFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _contentFocusNode.unfocus();
    _contentFocusNode.addListener(_focusNodeListener);
//    SystemChannels.textInput.invokeMethod('TextInput.hide');
    SystemChannels.textInput.invokeMethod('TextInput.show');

    /// WidgetsBinding 它能监听到第一帧绘制完成，第一帧绘制完成标志着已经Build完成
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ///获取输入框焦点
      /*FocusScope.of(context).requestFocus(_contentFocusNode);
      _contentFocusNode.unfocus();*/
    });

    getCurrentUser();
  }

  void _focusNodeListener() {
    // 用async的方式实现这个listener
    if (_contentFocusNode.hasFocus) {
      print('TextField got the focus');
    } else {
      print('TextField lost the focus');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _contentFocusNode.removeListener(_focusNodeListener);
    _contentFocusNode.dispose();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedUser = user;
        print(loggedUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void getMessages() async {
    final messages = await _firestore.collection('messages').getDocuments();
    for (var message in messages.documents) {
      print(message);
    }
  }

  void messageStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      print('======' + snapshot.documents.length.toString());
      for (var message in snapshot.documents) {
        print('-------------');
        print(message.data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onTap: () {
                        FocusScope.of(context).requestFocus(_contentFocusNode);
//                        I/InputMethodManager(19546): showSoftInput
//                        W/InputMethodManager(19546): startInputReason = 3
//                        FocusScope.of(context).requestFocus(_contentFocusNode);
                        print("tap ");
                      },
                      autofocus: false,
                      focusNode: _contentFocusNode,
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageTextController.clear();
                      final time = DateTime.now();
                      String formatTime = "${time.hour}:${time.minute}";
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': loggedUser.email,
                        'sendTime': time.toString(),
                        'sendFormatTime': formatTime
                      });
                      //Implement send functionality.
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data?.documents.reversed;
        List<MessageBubble> messageBubbles = [];
        if (messages != null)
          for (var message in messages) {
            final messageText = message.data['text'];
            final messageSender = message.data['sender'];
            final messageDateTime = message.data['sendTime'];
            final messageFormatTime = message.data['sendFormatTime'];
            final currentUser = loggedUser.email;
            //the message from the logger in user.
            final messageBubble = MessageBubble(
                text: messageText,
                sender: messageSender,
                isMe: currentUser == messageSender,
                messageDateTime: messageDateTime,
                formatTime: messageFormatTime);
            messageBubbles.add(messageBubble);
            messageBubbles.sort((a, b) => DateTime.parse(b.messageDateTime)
                .compareTo(DateTime.parse(a.messageDateTime)));
          }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;
  final bool isMe;
  final String messageDateTime;
  final String formatTime;
  MessageBubble(
      {Key? key,
      required this.sender,
      required this.text,
      required this.isMe,
      required this.messageDateTime,
      required this.formatTime})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(messageDateTime);

    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(formatTime,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.0, color: Colors.black38)),
          ),
          Text(
            sender,
            style: TextStyle(fontSize: 12.0, color: Colors.black54),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
                : BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    topRight: Radius.circular(30)),
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                '$text',
                style: TextStyle(
                    fontSize: 15, color: isMe ? Colors.white : Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
