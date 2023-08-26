import 'package:flutter/material.dart';

class HomePage5 extends StatefulWidget {
  const HomePage5({super.key});

  @override
  State<HomePage5> createState() => _HomePage5State();
}

class _HomePage5State extends State<HomePage5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context)
            ],
          )
        ),
      ),
      body: ListView(
        children: [
          buildStories(),
          const SizedBox(height: 30.0),
          buildPost(),
          const SizedBox(height: 30.0),
          buildPost(),
          const SizedBox(height: 30.0),
          buildPost()
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Material(
    color: Colors.blueGrey.shade400,
    child: InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(
          top: 24 + MediaQuery.of(context).padding.top,
          bottom: 24
        ),
        //color: Colors.blueGrey.shade400,
        child: Column(
          children: const [
            CircleAvatar(
              radius: 52,
              backgroundImage: AssetImage('images/rose.png'),
            ),
            SizedBox(height: 12.0),
            Text(
              'Night Angel',
              style: TextStyle(fontSize: 28.0, color: Colors.white),
            ),
            Text(
              'nightangel@gmail.com',
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            )
          ],
        ),
      ),
    ),
  );

  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(24.0),
    child: Wrap(
      runSpacing: 16,
      children: [
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Home'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.ondemand_video_outlined),
          title: const Text('Play Video'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.favorite_border_outlined),
          title: const Text('Favourites'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.notifications_outlined),
          title: const Text('Notifications'),
          onTap: () {},
        ),
        const Divider(color: Colors.black54,),
        ListTile(
          leading: const Icon(Icons.account_tree_outlined),
          title: const Text('Plugins'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.update),
          title: const Text('Updates'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: const Text('Settings'),
          onTap: () {},
        )
      ],
    ),
  );

  Widget buildStories() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12.0),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            height: 100.0,
            width: 70.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.blueGrey, width: 5)
            ),
            child: Image.asset('images/salman.jpg', fit: BoxFit.fill,)
          ),
          const SizedBox(width: 12.0),
          Container(
            height: 100.0,
            width: 70.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.blueGrey, width: 5)
            ),
            child: Image.asset('images/butterfly.jpeg', fit: BoxFit.fill,)
          ),
          const SizedBox(width: 12.0),
          Container(
            height: 100.0,
            width: 70.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.blueGrey, width: 5)
            ),
            child: Image.asset('images/images.jpeg', fit: BoxFit.fill,)
          ),
          const SizedBox(width: 12.0),
          Container(
            height: 100.0,
            width: 70.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.blueGrey, width: 5)
            ),
            child: Image.asset('images/katrina_kaif.jpg', fit: BoxFit.fill,)
          ),
          const SizedBox(width: 12.0),
          Container(
            height: 100.0,
            width: 70.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.blueGrey, width: 5)
            ),
            child: Image.asset('images/rose.png', fit: BoxFit.fill,)
          ),
          const SizedBox(width: 12.0),
          Container(
            height: 100.0,
            width: 70.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.blueGrey, width: 5)
            ),
            child: Image.asset('images/katrina_kaif_2.png', fit: BoxFit.fill,)
          ),
        ],
      ),
    );
  }

  Widget buildPost() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      height: 380.0,
      width: 380.0,
      decoration: const BoxDecoration(
        border: Border.symmetric(horizontal: BorderSide())
      ),
      child: Column(
        children: [
          Row(
            children: const [
              CircleAvatar(),
              SizedBox(width: 12.0),
              Text(
                "Salman Khan",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Image.asset('images/salman.jpg', fit: BoxFit.fill,),
          const SizedBox(height: 20.0),
          SizedBox(
            height: 60.0,
            child: Row(
              children: const[
                Icon(Icons.thumb_up_alt_outlined),
                SizedBox(width: 5.0),
                Text('Like'),
                SizedBox(width: 45.0),
                Icon(Icons.chat_bubble_outline),
                SizedBox(width: 5.0),
                Text('Comment'),
                SizedBox(width: 45.0),
                Icon(Icons.share_outlined),
                SizedBox(width: 5.0),
                Text('Share')
              ],
            ),
          )
        ],
      ),
    );
  }
}