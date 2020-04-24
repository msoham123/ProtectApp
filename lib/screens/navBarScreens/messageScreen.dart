import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protect/services/firestore_service.dart';
import 'package:protect/videoChat/index.dart';
import 'package:protect/components/message_bubble.dart';
import 'package:protect/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

FirebaseUser loggedInUser;
final _firestore = Firestore.instance;
final _auth = FirebaseAuth.instance;
String loggedInUserName = '';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController messageTextController =
      new TextEditingController();
  String messageText = '';

  bool selected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    final _firestoreService = Provider.of<FirestoreService>(context, listen: false);
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        DocumentSnapshot ds = await _firestoreService.getUserDocumentSnapshot(loggedInUser.uid);
        loggedInUserName = ds.data['full_name'];
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Messages",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          icon: Icon(Icons.video_call),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => IndexPage()));
          },
        ),
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          PopupMenuButton<int>(
            icon: Icon(
              Icons.arrow_drop_down,
              size: 35,
            ),
            offset: Offset(0, 100),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text("Global Chat"),
              ),
              PopupMenuItem(
                value: 2,
                child: Text("Coronavirus Chat"),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
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
                      _firestore.collection('global_chat').add({
                        'text': messageText,
                        'sender': loggedInUserName,
                        'timestamp': FieldValue.serverTimestamp(),
                      });
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

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('global_chat')
          .orderBy('timestamp', descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        // flutter's async snapshot
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.purpleAccent,
            ),
          );
        } else {
          final messages = snapshot.data.documents.reversed;
          List<MessageBubble> messageBubbles = [];
          for (var message in messages) {
            // data = document snapshot from firebase
            final messageText = message.data['text'];
            final messageSender = message.data['sender'];
            final currentUser = loggedInUserName;

            final messageWidget = MessageBubble(
              text: messageText,
              sender: messageSender,
              isMe: currentUser == messageSender,
            );
            messageBubbles.add(messageWidget);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: messageBubbles,
            ),
          );
        }
      },
    );
  }
}
