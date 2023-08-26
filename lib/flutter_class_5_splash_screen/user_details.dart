import 'package:application_1/flutter_class_5_splash_screen/bottom_bar.dart';
import 'package:flutter/material.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 250.0,
              decoration: const BoxDecoration(
                color: Colors.red
              ),
              child: const Center(
                child: Icon(Icons.account_circle_outlined, size: 120.0, color: Colors.white,),
              ),
            ),
          ),
          const SizedBox(height: 80.0),
          Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextField(
                cursorColor: Colors.red,
                decoration: InputDecoration(
                  labelText: 'email',
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)
                    )
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    labelText: 'password',
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)
                    )
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 20.0)
            ),
            child: const Text("Login"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MaterialBottom()));
            }
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 60);

    var controllPoint = Offset(50, size.height);

    var endPoint = Offset(size.width/2, size.height);
    path.quadraticBezierTo(controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }

}

