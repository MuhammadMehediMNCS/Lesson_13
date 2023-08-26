import 'package:flutter/material.dart';

class MyAnimatedButton extends StatelessWidget {
  const MyAnimatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: const MyButton(),
    );
  }
}

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Column(
          children: const [
            FollowButtonWidget(),
            LoadingOutlinedButton()
          ],
        ),
      ),
    );
  }  
}


class FollowButtonWidget extends StatefulWidget {
  const FollowButtonWidget({Key? key}) : super(key: key);

  @override
  State<FollowButtonWidget> createState() => _FollowButtonWidgetState();
}

class _FollowButtonWidgetState extends State<FollowButtonWidget> {
  bool isSmall = true;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      setState(() {
        isSmall = !isSmall;
      });
    },
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
      width: isSmall ? 50 : 200,
      height: 50,
      child: isSmall ? buildShrinked() : buildStretched(),
    ),
  );

  Widget buildStretched() => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.red, width: 2.5),
      borderRadius: BorderRadius.circular(24),
    ),
    child: const Center(
      child: FittedBox(
        child: Text(
          'FOLLOW',
          style: TextStyle(
            color: Colors.red,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
    ),
  );

  Widget buildShrinked() => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: Colors.red
    ),
    child: const Icon(
      Icons.people,
      color: Colors.white,
    ),
  );
}

enum ButtonState { init, loading, done }
class LoadingOutlinedButton extends StatefulWidget {
  const LoadingOutlinedButton({Key? key}) : super(key: key);

  @override
  State<LoadingOutlinedButton> createState() => _LoadingOutlinedButtonState();
}

class _LoadingOutlinedButtonState extends State<LoadingOutlinedButton> {
  ButtonState state = ButtonState.init;
  bool isAniamting = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isStretched = isAniamting || state == ButtonState.init;
    final isDone = state == ButtonState.done;

    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 2000),
          curve: Curves.easeIn,
          width: state == ButtonState.init ? width : 70,
          onEnd: () => setState(() => isAniamting = !isAniamting),
          height: 70,
        child: isStretched ? buildButton() : buildSmallButton(isDone),
        ),
    );
  }

  Widget buildButton() => OutlinedButton(
    style: OutlinedButton.styleFrom(
      shape: const StadiumBorder(),
      side: const BorderSide(width: 2, color: Colors.indigo)
    ),
    child: const FittedBox(
      child: Text(
        'SUBMIT',
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.indigo,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w600
        ),
      ),
    ),
    onPressed: () async {
      setState(() => state = ButtonState.loading);
      await Future.delayed(const Duration(seconds: 3));
      setState(() => state = ButtonState.done);
      await Future.delayed(const Duration(seconds: 3));
      setState(() => state = ButtonState.init);
    }
  );

  Widget buildSmallButton(bool isDone) {
    final color = isDone ? Colors.green : Colors.indigo;

    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(
        child: isDone
        ? const Icon(Icons.done, size: 52, color: Colors.white)
        : const CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}