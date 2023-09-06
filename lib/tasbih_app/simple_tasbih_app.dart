import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class TasbihApp extends StatelessWidget {
  const TasbihApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TasbihDesign(),
    );
  }
}

class TasbihDesign extends StatefulWidget {
  const TasbihDesign({super.key});

  @override
  State<TasbihDesign> createState() => _TasbihDesignState();
}

class _TasbihDesignState extends State<TasbihDesign> {
  int counter = 0;
  int targetValue = 33;
  bool isTap = true;

  GetStorage box = GetStorage();

  @override
  void initState() {
    readData();
    box.writeIfNull('data', 0);
    
    super.initState();
  }

  readData() {
    counter = box.read('data');
  }

  writeData(int value) {
    box.write('data', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 4, 112, 85),
        title: const Text(
          'Tasbih App',
          style: TextStyle(fontFamily: 'SutonnyOMJ'),
        ),
        centerTitle: true,
        bottom:PreferredSize(
          preferredSize: const Size(double.infinity, 80),
          child: buildAppBottom()
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: 180,
              width: 240,
              decoration: BoxDecoration(
                border: Border.all(width: 8, color: Colors.grey),
                borderRadius: BorderRadius.circular(38),
                color: const Color.fromARGB(255, 4, 112, 85)
              ),
              child: Center(
                child: Container(
                  height: 90,
                  width: 190,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 12, 122, 85)
                  ),
                  child: Center(
                    child: Text(
                      '$counter',
                      style: const TextStyle(
                        fontFamily: 'Agency FB',
                        fontSize: 40,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(255, 45, 206, 184),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.refresh, color: Colors.white, size: 36,),
                    onPressed: () {
                      setState(() {
                        counter = 0;
                      });
                    }
                  )
                ),
                Container(
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: isTap ? const Color.fromARGB(255, 45, 206, 184) : Colors.red,
                  ),
                  child: IconButton(
                    icon: isTap ? const Icon(Icons.lock_open, color: Colors.white, size: 36,) : const Icon(Icons.lock, color: Colors.white, size: 36,),
                    onPressed: () {
                      setState(() {
                        isTap = !isTap;
                      });
                    }
                  )
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              height: 70,
              width: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 12, 122, 85)
              ),
              child:InkWell(
                child: const Center(
                  child: Text(
                    'Tap',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
                onTap: () {
                  if(isTap == true) {
                    setState(() {
                      counter++;
                      writeData(counter);
                    });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildAppBottom() {
    return Column(
      children: [
        Container(
          height: 80,
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Target : $targetValue',
                style: const TextStyle(
                  fontFamily: 'SutonnyOMJ', fontSize: 20, color: Colors.white
                ),
              ),
              if(counter == targetValue)
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(
                  'images/check_mark.png',
                  height: 36,
                  width: 36,
                  color: const Color.fromARGB(255, 4, 112, 85),
                ),
              ),
            ],
          ),
        ),
      ]
    );
  }
}
