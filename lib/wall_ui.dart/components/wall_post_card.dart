import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../commons/breakpoints.dart';
import '../../posts/domain/entities/post_response_entity.dart';
import '../base_components/wall_card_title.dart';
import '../base_components/wall_chip.dart';
import '../tokens/wall_gradients.dart';

class WallPostCard extends StatefulWidget {
  final PostResponseEntity post;
  final LayoutClass device;
  final bool isNew;
  const WallPostCard({
    Key? key,
    required this.post,
    required this.device,
    this.isNew = false,
  }) : super(key: key);

  @override
  State<WallPostCard> createState() => _WallPostCardState();
}

class _WallPostCardState extends State<WallPostCard> {
  BoxDecoration get borderDecoration => widget.isNew
      ? const BoxDecoration(gradient: WallGradients.primaryGradient)
      : BoxDecoration(color: Theme.of(context).cardColor);

  BoxDecoration get decoration =>
      widget.isNew ? BoxDecoration(color: Theme.of(context).cardColor) : const BoxDecoration();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: borderDecoration,
      child: DecoratedBox(
        decoration: decoration,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (widget.isNew) const WallChip(label: 'new'),
                  const Spacer(),
                  Text(
                    DateFormat('MMM dd, y').format(widget.post.createdAt.toLocal()).toString(),
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                ],
              ),
              const SizedBox(height: 16),
              WallCardTitle(device: widget.device, title: widget.post.title),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  widget.post.content,
                  maxLines: 4,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  widget.post.createdBy,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        overflow: TextOverflow.ellipsis,
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  Icons.arrow_forward,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
