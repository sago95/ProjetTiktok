import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TikTok',
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidget();
}

class _MyStatefulWidget extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem> [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: 'Acceuil'
          ),
          const BottomNavigationBarItem(
              icon: Icon(Ionicons.compass_outline, size: 35,),
              label: 'Découvrir'
          ),
           BottomNavigationBarItem(
              icon: Image.asset('assets/images/tiktok_add.png',
              height:40),
              label: ''
          ),
          const BottomNavigationBarItem(
              icon: Icon(MdiIcons.commentMinusOutline, size: 30),
              label: 'Boîte de réception'
          ),
          BottomNavigationBarItem(
              icon: Image.asset('assets/images/user.png', height: 25,),
              label: 'Profil'
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF141518),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage ({Key? key}) : super(key: key);
  final List<Map> tiktokItems = [
    {
      "video": "assets/videos/video_1.mp4",
    },
    {
      "video": "assets/videos/video_2.mp4",
    },
    {
      "video": "assets/videos/video_3.mp4",
    },
    {
      "video": "assets/videos/video_4.mp4",
    },
    {
      "video": "assets/videos/video_5.mp4",
    },
    {
      "video": "assets/videos/video_6.mp4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: double.infinity,
          scrollDirection: Axis.vertical,
          viewportFraction: 1.0,
      ),
      items: tiktokItems.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              color: const Color(0xFF141518),
              child: Stack(
                children: [
                  VideoWidget(videoUrl: item['video']),
                  const PostContent()
                ],
              ),
              );
            },
          );
        }).toList(),
      );
    }
  }

  class VideoWidget extends StatefulWidget {
    const VideoWidget({Key? key, required this.videoUrl}) : super(key:key);
    final String videoUrl;
    
    @override
    _VideoWidgetState createState() => _VideoWidgetState(this.videoUrl);
  }

  class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;
  final String videoUrl;
  _VideoWidgetState(this.videoUrl);

  @override
  void initState(){
    super.initState();
    _controller = VideoPlayerController.asset(videoUrl)
      ..initialize().then((_) {
        _controller.play();
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return VideoPlayer(_controller);
    }
  }

  class PostContent extends StatelessWidget {
    const PostContent({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Column(
        children: [
          Container(
            height: 100,
            // color: Colors.blue,
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'Abonnements  ',
                  style:
                  TextStyle(color: Colors.white54,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  '|  Pour toi',
                  style:
                  TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(width: 90),
                Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 35,
                ),
                SizedBox(width: 25),
              ],
            ),
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      // color: Colors.red.withOpacity(0.5),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '@User_user',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                           SizedBox(height: 10),
                           Text(
                            'drescription description description #tag @User #tag #stag #tag',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: const [
                              Icon(
                                MdiIcons.music,
                                color: Colors.white,
                                size: 15,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Titre musique - auteur',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 30),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                      width: 80,
                      padding: const EdgeInsets.only(bottom: 10),
                      // color: Colors.green,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 80,
                            // color: Colors.blue,
                            child: Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: const CircleAvatar(
                                    radius: 25,
                                    backgroundImage: AssetImage('assets/images/photo-5.jpg'),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 80,
                            // color: Colors.teal,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.white.withOpacity(0.85),
                                  size: 45,
                                ),
                                const Text(
                                  '25.0K',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 80,
                            // color: Colors.yellow,
                            child: Column(
                              children: [
                                Icon(
                                  MdiIcons.chatProcessing,
                                  color: Colors.white.withOpacity(0.85),
                                  size: 45,
                                ),
                                const Text(
                                  '156',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 80,
                            // color: Colors.orange,
                            child: Column(
                              children: [
                                Icon(
                                  Ionicons.arrow_redo,
                                  color: Colors.white.withOpacity(0.85),
                                  size: 40,
                                ),
                                const Text(
                                  '123',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 80,
                            // color: Colors.orange,
                            child: Column(
                              children: [
                                Icon(
                                  MdiIcons.dotsHorizontal,
                                  color: Colors.white.withOpacity(0.85),
                                  size: 45,
                                ),
                              ],
                            ),
                          ),
                          AnimatedLogo(),
                        ],
                      ),
                  )
                ],
              ),
            ),
        ],
      );
    }
  }
class AnimatedLogo extends StatefulWidget {
  AnimatedLogo({Key? key}) : super(key: key);

  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: child,
        );
      },
      child: Container(
        height: 45,
        width: 45,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: AssetImage("assets/images/disc_icon.png"),
          ),
        ),
        child: Image.asset('assets/images/tiktok_icon.png'),
      ),
    );
  }
}

