import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../commons/breakpoints.dart';
import '../../../../wall_ui.dart/components/wall_post_card.dart';
import '../../../domain/entities/post_response_entity.dart';

class CardsGridWidget extends StatelessWidget {
  final LayoutClass device;
  final bool loading;
  final List<PostResponseEntity> posts;
  const CardsGridWidget({
    Key? key,
    required this.device,
    required this.loading,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loading == true
        ? const Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            ),
          )
        : GridView.builder(
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
                device: device,
                isNew: index < 2,
                post: posts[index],
                onTap: () => Modular.to.pushNamed('/home/post/${posts[index].id}'),
              );
            },
          );
  }
}
