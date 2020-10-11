import 'package:flutter/material.dart';
import 'package:sample/swipe_down_to_pop_handler.dart';
import 'package:sample/swipe_down_to_pop_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SwipeDownToPopContainerDemo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case DetailPage.routeName:
            return SwipeDownToPopRoute(
              widget: DetailPage(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => Container(),
            );
        }
      },
    );
  }
}

class Site {
  final String imageUrl;
  final String name;
  final String city;

  Site(
    this.imageUrl,
    this.name,
    this.city,
  );
}

class HomePage extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Site> _list = [
    Site('images/image_01.jpg', 'Bridge', 'San Francisco'),
    Site('images/image_02.jpg', 'Firefox', 'San Francisco'),
    Site('images/image_03.jpg', 'Fishermans Werf', 'San Francisco'),
    Site('images/image_04.jpg', 'San Francisco', 'San Francisco'),
    Site('images/image_05.jpg', 'Marina Bay Sans', 'Singapore'),
    Site('images/image_06.jpg', 'Gardens by the bay', 'Singapore'),
    Site('images/image_07.jpg', 'Buildings', 'Singapore'),
    Site('images/image_08.jpg', 'Marina Bay Sans', 'Singapore'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SwipeDownToPopContainerDemo'),
      ),
      body: Container(
        child: ListView.builder(
          padding: const EdgeInsets.all(4),
          itemCount: _list.length,
          itemBuilder: (context, index) {
            final site = _list[index];
            return ImageCard(site);
          },
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final Site site;

  ImageCard(this.site);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(DetailPage.routeName);
        },
        child: Container(
          height: 280,
          child: Column(
            children: [
              Image.asset(
                site.imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        site.name,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        site.city,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  static const routeName = '/detail';

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SwipeDownToPopContainer(
        scrollable: ListView(),
        handler: DefaultSwipeDownToPopHandler(),
      ),
    );
  }
}
