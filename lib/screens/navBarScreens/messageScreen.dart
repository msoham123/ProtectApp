import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protect/services/firestore_service.dart';
import 'package:protect/videoChat/index.dart';
import 'package:protect/components/message_bubble.dart';
import 'package:protect/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:protect/ChatRooms.dart';

FirebaseUser loggedInUser;
final _firestore = Firestore.instance;
final _auth = FirebaseAuth.instance;
String loggedInUserName = '';
bool _loading = true;
var chatRoom = 'global_chat';

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

  String currentChat(){
    return (chatRoom=="global_chat") ? "Global Chat" : (chatRoom=="coronavirus_chat") ? "Covid-19 Chat" : (chatRoom=="climate_change_chat") ? "Climate Change Chat" : (chatRoom=="amazon_rainforest_chat") ? "Amazon Rainforest Chat" : (chatRoom=="great_barrier_reef_chat") ? "Great Barrier Reef Chat" : null;
  }

  void getCurrentUser() async {
    final _firestoreService = Provider.of<FirestoreService>(
        context, listen: false);
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        DocumentSnapshot ds = await _firestoreService.getUserDocumentSnapshot(
            loggedInUser.uid);
        loggedInUserName = ds.data['full_name'];
        setState(() {
          _loading = false;
        });
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
          PopupMenuButton<String>(
            onSelected: switchRoom,
            itemBuilder: (BuildContext context) {
              return ChatRooms.rooms.map((String choice){
                return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice)
                );
              }).toList();
            },
          )
//          PopupMenuButton<int>(
//            icon: Icon(
//              Icons.arrow_drop_down,
//              size: 35,
//            ),
//            offset: Offset(0, 100),
//            itemBuilder: (context) => [
//              PopupMenuItem(
//                value: 1,
//                child: Text("Global Chat"),
//              ),
//              PopupMenuItem(
//                value: 2,
//                child: Text("Coronavirus Chat"),
//              ),
//            ],
//          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width/1.5,
              color: Colors.deepPurple,
              height: MediaQuery.of(context).size.height/25,
              child: Center(
                child: Text(currentChat(),
                  style: TextStyle(color: Colors.white),),
              ),
            ),
            _loading
                ? Center(child: CircularProgressIndicator())
                : MessagesStream(),
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
                      if (messageTextController.text != "") {
                        messageTextController.clear();
                        _firestore.collection(chatRoom).add({
                          'text': messageText,
                          'sender': loggedInUserName,
                          'timestamp': FieldValue.serverTimestamp(),
                        });
                      }
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
  void switchRoom(String room) {
    if(room == "Coronavirus"){
      setState(() {
        chatRoom = 'coronavirus_chat';
      });
    } else if(room == 'Global'){
      setState(() {
        chatRoom = 'global_chat';
      });
    } else if(room == 'Climate Change'){
      setState(() {
        chatRoom = 'climate_change_chat';
      });
    } else if(room == 'Amazon Rainforest'){
      setState(() {
        chatRoom = 'amazon_rainforest_chat';
      });
    } else if(room == 'Great Barrier Reef'){
      setState(() {
        chatRoom = 'great_barrier_reef_chat';
      });
    }
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection(chatRoom)
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
