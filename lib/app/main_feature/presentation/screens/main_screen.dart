import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_post_video/app/main_feature/presentation/controller/main_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: GetBuilder<MainController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton.filled(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                    const Text(
                      'Total Page: 25',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton.filled(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.separated(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          color: Colors.greenAccent.withOpacity(0.2),
                        ),
                        height: 200,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(20),
                              ),
                              child: Image.network(
                                'http://moviesapi.ir/images/tt0111161_poster.jpg',
                                width: 133,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width - 173,
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      child: Text(
                                        'The Shawshank Redemption',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Icon(Icons.menu),
                                        Text('Crime, '),
                                        Text('Drama'),
                                        SizedBox(width: 20),
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(width: 3),
                                        Text('85%'),
                                      ],
                                    ),
                                    Divider(
                                      height: 10,
                                      endIndent: 30,
                                    ),
                                    Text('Director: Martin Owen'),
                                    Text(
                                        'Actors: Arielle Prepetit, Bella-Rose Love, Bruce Cooper'),
                                    Spacer(),
                                    Text('Country: USA'),
                                    Row(
                                      children: [
                                        Text('Year: 2023'),
                                        SizedBox(width: 20),
                                        Icon(
                                          Icons.slow_motion_video_rounded,
                                          size: 20,
                                        ),
                                        SizedBox(width: 5),
                                        Text('5.9'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
