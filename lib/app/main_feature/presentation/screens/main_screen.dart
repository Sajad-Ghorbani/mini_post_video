import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_post_video/app/main_feature/domain/entities/video_entity.dart';
import 'package:mini_post_video/app/main_feature/presentation/controller/main_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: GetBuilder<MainController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                if (controller.metaData != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton.filled(
                        onPressed: () {
                          controller.goToPrePage();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                      Text(
                        'Current Page: ${controller.metaData!.currentPage}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Total: ${controller.metaData!.pageCount}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton.filled(
                        onPressed: () {
                          controller.goToNextPage();
                        },
                        icon: const Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ],
                  ),
                const SizedBox(height: 10),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (controller.showLoading == true) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } //
                      return ListView.separated(
                        itemCount: controller.videos.length,
                        itemBuilder: (context, index) {
                          VideoEntity video = controller.videos[index];
                          return FadeInDown(
                            delay: Duration(milliseconds: index * 200),
                            from: 50,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color(0xff23232b),
                              ),
                              height: 220,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.horizontal(
                                      left: Radius.circular(20),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: video.poster!,
                                      width: 130,
                                      height: 220,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: SizedBox(
                                      width:
                                          MediaQuery.sizeOf(context).width - 170,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            video.title!,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.menu,
                                                size: 18,
                                              ),
                                              ...video.genres!.map(
                                                (e) {
                                                  String genre =
                                                      e == video.genres!.last
                                                          ? e
                                                          : '$e, ';
                                                  return Text(
                                                    genre,
                                                    style: const TextStyle(
                                                        fontSize: 12),
                                                  );
                                                },
                                              ),
                                              const Spacer(),
                                              const Icon(
                                                Icons.favorite,
                                                color: Colors.grey,
                                                size: 18,
                                              ),
                                              const SizedBox(width: 3),
                                              const Text(
                                                '85%',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          const Divider(
                                            height: 10,
                                            endIndent: 30,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                              ),
                                              children: [
                                                const TextSpan(
                                                  text: 'Director: ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: video.director!,
                                                ),
                                              ],
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                              ),
                                              children: [
                                                const TextSpan(
                                                  text: 'Actors: ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: video.actors!,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          FittedBox(
                                              child: Text(
                                                  'Country: ${video.country}')),
                                          Row(
                                            children: [
                                              Text('Year: ${video.year}'),
                                              const SizedBox(width: 20),
                                              const Icon(
                                                Icons.slow_motion_video_rounded,
                                                size: 20,
                                              ),
                                              const SizedBox(width: 5),
                                              Text(video.imdbRating!),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 10);
                        },
                      );
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
