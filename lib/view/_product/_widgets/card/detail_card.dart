import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mvvm_app/view/home/detail/model/detail_model.dart';

class DetailCard extends StatelessWidget {
  final DetailModel? model;

  const DetailCard({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        Expanded(child: Image.network(model?.image! ?? "")),
        Text("${model?.name}"),
        buildStars(),
        Text("${model?.price} \$"),
      ],
    ));
  }

  RatingBar buildStars() {
    return RatingBar.builder(
      itemCount: 5,
      itemSize: 18,
      initialRating: (model?.rates ?? 0).toDouble(),
      ignoreGestures: true,
      itemPadding: EdgeInsets.zero,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}

extension DetailCardExtension on DetailCard {
  Widget buildList(List<DetailModel> items) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items.map((e) => DetailCard(model: e)).toList(),
      ),
    );
  }
}
