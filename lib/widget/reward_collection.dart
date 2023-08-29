import 'package:flutter/material.dart';

class CustomScreen extends StatefulWidget {
  final ValueChanged<String>? onImageTap;

  CustomScreen({this.onImageTap});

  @override
  _CustomScreenState createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  Map<int, bool> imageStatusMap = {
    0: true,
    1: false,
    2: true,
    3: true,
    4: false,
    5: true,
    6: true,
    7: false,
    8: true,
    9: true,
    // ... add more index-value pairs
  };


  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10.0, // Gap between columns
        mainAxisSpacing: 10.0, // Gap between rows
      ),
      itemCount: 12,
      itemBuilder: (BuildContext context, int index) {
        String imagePath = 'asset/img/fig${index+1}.jpg'; // 이미지 경로를 적절히 수정해주세요.
        bool isClickable = imageStatusMap[index] ?? false;
        return MyClickableImage(
          imagePath: imagePath,
          isClickable: isClickable,
          onTap: () {
            if (isClickable && widget.onImageTap != null) { // isClickable이 true일 때만 작동
              widget.onImageTap!(imagePath); // 클릭한 이미지 경로 전달
            }// 클릭한 이미지 경로 전달

            },
        );
      },
    );
  }
}

class MyClickableImage extends StatelessWidget {
  final String imagePath;
  final bool isClickable;
  final VoidCallback? onTap;

  MyClickableImage({
    required this.imagePath,
    required this.isClickable,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = Image.asset(
      imagePath,
      width: 50,
      height: 50,
      fit: BoxFit.scaleDown,
    );

    if (!isClickable) {
      imageWidget = ColorFiltered(
        colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
        child: imageWidget,
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        child: imageWidget,
      ),
    );
  }
}