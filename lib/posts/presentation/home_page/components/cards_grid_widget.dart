import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../commons/breakpoints.dart';
import '../../../../wall_ui/base_components/wall_loader.dart';
import '../../../../wall_ui/components/wall_post_card.dart';
import '../../../domain/entities/post_response_entity.dart';

class CardsGridWidget extends StatelessWidget {
  final LayoutClass device;
  final bool loading;
  final List<PostResponseEntity> posts;
  final bool owner;
  final VoidCallback onPop;
  const CardsGridWidget({
    Key? key,
    required this.device,
    required this.loading,
    required this.posts,
    required this.onPop,
    this.owner = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loading == true
        ? const WallLoader.large()
        : posts.isNotEmpty
            ? GridView.builder(
                padding: device == LayoutClass.desktop
                    ? EdgeInsets.only(
                        bottom: 40,
                        left: MediaQuery.of(context).size.width * 0.15,
                        right: MediaQuery.of(context).size.width * 0.15,
                      )
                    : const EdgeInsets.only(bottom: 40, left: 16, right: 16),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: 400,
                  maxCrossAxisExtent: 400,
                  childAspectRatio: 1,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                ),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return WallPostCard(
                    key: Key(posts[index].id),
                    owner: owner,
                    device: device,
                    isNew: index < 2,
                    post: posts[index],
                    onTap: () => Modular.to
                        .pushNamed('/home/post/$owner/${posts[index].id}/', arguments: owner)
                        .then((value) => onPop()),
                  );
                },
              )
            : Column(
                children: [
                  Text('No post yet. Why don\'t you open this wall?',
                      style: Theme.of(context).textTheme.headline6),
                  Expanded(
                    child: Image.asset(
                      "assets/images/empty_list.png",
                    ),
                  ),
                ],
              );
  }
}
