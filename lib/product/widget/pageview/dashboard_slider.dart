import 'package:flutter/material.dart';
import 'package:mvvm_app/core/extension/context_extension.dart';
import 'package:mvvm_app/view/home/dashboard/model/slider_model.dart';

class DashBoardSlider extends StatefulWidget {
  final List<SliderModel>? sliderModel;
  const DashBoardSlider({Key? key, this.sliderModel}) : super(key: key);

  @override
  State<DashBoardSlider> createState() => _DashBoardSliderState();
}

class _DashBoardSliderState extends State<DashBoardSlider> {
  int _selectedValueIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 9, child: buildPageView()),
        Expanded(child: buildListViewCircleIndicator())
      ],
    );
  }

  PageView buildPageView() {
    return PageView.builder(
      controller: PageController(viewportFraction: 0.8),
      onPageChanged: _changeValue,
      itemCount: widget.sliderModel!.length,
      itemBuilder: (context, index) => buildCardImage(index),
    );
  }

  ListView buildListViewCircleIndicator() {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.sliderModel!.length,
        itemBuilder: (context, index) => Padding(
              padding: context.paddingLow,
              child: CircleAvatar(
                backgroundColor: _selectedValueIndex == index
                    ? Colors.black
                    : Colors.black.withOpacity(0.2),
                radius: 10,
              ),
            ));
  }

  Card buildCardImage(int index) {
    return Card(
      color: Colors.black,
      child: Image.network(
        widget.sliderModel![index].image!,
        fit: BoxFit.cover,
      ),
    );
  }

  void _changeValue(int index) {
    _selectedValueIndex = index;
    setState(() {});
  }
}
