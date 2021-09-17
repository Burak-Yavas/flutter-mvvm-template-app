import 'package:flutter/material.dart';
import 'package:mvvm_app/view/home/restaurants/model/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant? restaurant;
  final VoidCallback? onPressed;
  const RestaurantCard({Key? key, this.restaurant, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(restaurant!.image!),
      ),
      title: Text(restaurant!.name!),
      subtitle: Text(restaurant!.company!),
      trailing: ElevatedButton(
        onPressed: () {},
        child: Text("Rate"),
      ),
    );
  }
}
