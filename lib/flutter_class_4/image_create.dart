import 'package:flutter/material.dart';

class CreateImage extends StatelessWidget {
  static const String title = 'Asset Images With Layout Builder';

  const CreateImage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: const DesignOrientation(),
    );
  }
}

class CreatedImages extends StatefulWidget {
  const CreatedImages({super.key});

  @override
  State<CreatedImages> createState() => _CreatedImagesState();
}

class _CreatedImagesState extends State<CreatedImages> {
  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(CreateImage.title),
      ),
      body: LayoutBuilder(
        builder: (constext, constraints) {
          if(constraints.maxWidth < 600) {
            return buildPage();
          } else {
            return buildPages();
          }
        }
      ),
    );
  }

  Widget buildPage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'images/salman.jpg',
                  height: 150.0,
                  width: 150.0,
                ),
                const SizedBox(
                  width: 20.0
                ),
              Image.asset(
                'images/salman.jpg',
                height: 150.0,
                width: 150.0,
              ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'images/salman.jpg',
                  height: 150.0,
                  width: 150.0,
                ),
                const SizedBox(
                  width: 20.0
                ),
              Image.asset(
                'images/salman.jpg',
                height: 150.0,
                width: 150.0,
              ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'images/salman.jpg',
                  height: 150.0,
                  width: 150.0,
                ),
                const SizedBox(
                  width: 20.0
                ),
              Image.asset(
                'images/salman.jpg',
                height: 150.0,
                width: 150.0,
              ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'images/salman.jpg',
                  height: 150.0,
                  width: 150.0,
                ),
                const SizedBox(
                  width: 20.0
                ),
              Image.asset(
                'images/salman.jpg',
                height: 150.0,
                width: 150.0,
              ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildPages() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'images/salman.jpg',
                  height: 150.0,
                  width: 150.0,
                ),
                const SizedBox(
                  width: 20.0
                ),
              Image.asset(
                'images/salman.jpg',
                height: 150.0,
                width: 150.0,
              ),
              const SizedBox(
                  width: 20.0
                ),
              Image.asset(
                'images/salman.jpg',
                height: 150.0,
                width: 150.0,
              ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                'images/salman.jpg',
                height: 150.0,
                width: 150.0,
              ),
              const SizedBox(
                  width: 20.0
                ),
                Image.asset(
                  'images/salman.jpg',
                  height: 150.0,
                  width: 150.0,
                ),
                const SizedBox(
                  width: 20.0
                ),
              Image.asset(
                'images/salman.jpg',
                height: 150.0,
                width: 150.0,
              ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                'images/salman.jpg',
                height: 150.0,
                width: 150.0,
              ),
              const SizedBox(
                  width: 20.0
                ),
                Image.asset(
                  'images/salman.jpg',
                  height: 150.0,
                  width: 150.0,
                ),
                const SizedBox(
                  width: 20.0
                ),
              Image.asset(
                'images/salman.jpg',
                height: 150.0,
                width: 150.0,
              ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                'images/salman.jpg',
                height: 150.0,
                width: 150.0,
              ),
              const SizedBox(
                  width: 20.0
                ),
                Image.asset(
                  'images/salman.jpg',
                  height: 150.0,
                  width: 150.0,
                ),
                const SizedBox(
                  width: 20.0
                ),
              Image.asset(
                'images/salman.jpg',
                height: 150.0,
                width: 150.0,
              ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


class DesignOrientation extends StatefulWidget {
  const DesignOrientation({super.key});

  @override
  State<DesignOrientation> createState() => _DesignOrientationState();
}

class _DesignOrientationState extends State<DesignOrientation> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final isPortrait = orientation == Orientation.portrait;
        final isMobile = MediaQuery.of(context).size.shortestSide < 600;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Orientation Builder'),
          ),
          drawer: isMobile ?
          Container(
                width: 280.0,
                color: Colors.blueGrey,
                child: const Center(child: Text('Side Bar', style: TextStyle(fontSize: 50.0),)),
          ) : null,
          body: Row(
            children: [
              if(!isMobile)
              Container(
                width: 280.0,
                color: Colors.blueGrey,
                child: const Center(child: Text('Side Bar', style: TextStyle(fontSize: 50.0),)),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: isPortrait ? 2 : 3,
                  children: List.generate(
                    40,
                    (index) => Card(
                    color: Colors.pink.shade200,
                    child: Center(child: Text('Item $index'),),
                  )
                ),
                )
              )
            ],
          ),
        );
      }
    );
  }
}