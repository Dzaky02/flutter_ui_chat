import 'package:flutter_ui_chat/models/user_model.dart';

enum ChatMessageType { text, audio, image, video }

class Message {
  final User sender;
  // Would usually be type DateTime or Firebase Timestamp in production apps
  final String time;
  final String text;
  final ChatMessageType messageType;
  final bool isLiked;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    this.messageType = ChatMessageType.text,
    this.isLiked = false,
    this.unread = false,
  });
}

// YOU - current user
final User currentUser = User(
    id: 0,
    name: 'Current User',
    imageUrl: 'assets/images/greg.jpg',
    isActive: true);

// USERS
final User greg = User(id: 1, name: 'Greg', imageUrl: 'assets/images/greg.jpg');
final User james =
    User(id: 2, name: 'James', imageUrl: 'assets/images/james.jpg');
final User john = User(
    id: 3, name: 'John', imageUrl: 'assets/images/john.jpg', isActive: true);
final User olivia =
    User(id: 4, name: 'Olivia', imageUrl: 'assets/images/olivia.jpg');
final User sam = User(id: 5, name: 'Sam', imageUrl: 'assets/images/sam.jpg');
final User sophia = User(
    id: 6,
    name: 'Sophia',
    imageUrl: 'assets/images/sophia.jpg',
    isActive: true);
final User steven = User(
    id: 7,
    name: 'Steven',
    imageUrl: 'assets/images/steven.jpg',
    isActive: true);
// --------------------
final User jenny =
    User(id: 8, name: 'Jenny Wilson', imageUrl: 'assets/images/user.png');
final User esther = User(
    id: 9,
    name: 'Esther Howard',
    imageUrl: 'assets/images/user_2.png',
    isActive: true);
final User ralph =
    User(id: 10, name: 'Ralph Edwards', imageUrl: 'assets/images/user_3.png');
final User jacob = User(
    id: 11,
    name: 'Jacob Jones',
    imageUrl: 'assets/images/user_4.png',
    isActive: true);
final User albert =
    User(id: 12, name: 'Albert Flores', imageUrl: 'assets/images/user_5.png');

// FAVORITE CONTACTS
List<User> favorites = [sam, steven, olivia, john, greg, james, jenny, albert];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: jenny,
    time: '3m ago',
    text: 'Hope you are doing well...',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: esther,
    time: '8m ago',
    text:
        'Hello! I\'am Esther Howard, I\'m currently looking for a freelancer.',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Party is about to ROCK!',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: olivia,
    time: '4:30 PM',
    text: 'LOL hahaha',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: john,
    time: '3:30 PM',
    text: 'Call me later, OK.',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sophia,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: steven,
    time: '1:30 PM',
    text: 'Check this out! It was so cool!',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sam,
    time: '12:30 PM',
    text: 'Hey, are you join the party tonight?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: greg,
    time: '11:30 AM',
    text: 'C\'mon bruh',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: ralph,
    time: 'yesterday',
    text: 'Do you have any update?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: jacob,
    time: '2d ago',
    text: 'You’re welcome :)',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: albert,
    time: '5d ago',
    text: 'Thanks',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: james,
    time: 'now',
    text: 'C\'mon, let\'s hang out man.',
  ),
  Message(
    sender: currentUser,
    time: '2min ago',
    text: 'WHAATT? looks great man!!',
  ),
  Message(
    sender: james,
    time: '5min ago',
    text: '',
    messageType: ChatMessageType.video,
    isLiked: true,
  ),
  Message(
    sender: currentUser,
    time: '30min ago',
    text: '',
    messageType: ChatMessageType.audio,
  ),
  Message(
    sender: james,
    time: '5:31 PM',
    text: 'You\'r joining the party right?',
  ),
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'I know, she\'s the best.',
    isLiked: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
  ),
  Message(
    sender: james,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
  ),
  Message(
    sender: james,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
  ),
  Message(
    sender: james,
    time: '2:00 PM',
    text: 'I ate so much food today.',
  ),
];
