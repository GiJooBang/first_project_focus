import 'package:flutter/material.dart';
import 'package:first_project_focus/widget/reward_collection.dart';

class ImageGrid extends StatefulWidget {
  @override
  _ImageGridState createState() => _ImageGridState();
}

class _ImageGridState extends State<ImageGrid> {
  String currentImagePath = 'asset/img/fig2.jpg'; // Initial image path

  void changeImage(String newPath) {
    setState(() {
      currentImagePath = newPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
      children: [
       const SizedBox(
        height: 10,
        ),
       Container(
        alignment: Alignment.centerLeft,
        child:
          const Text(
              '마이 펫',
              style: TextStyle(
                  fontSize: 20, // Set the desired font size
                  fontWeight: FontWeight.bold
              )
          )
      ),
       Container(
        height: 200,
        color: Colors.white,
        alignment: Alignment.center,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 200,
              color: Colors.grey,
              alignment: Alignment.center,
              child: Image.asset(currentImagePath, // 기본 이미지 경로 표시
                fit: BoxFit.scaleDown,
            ),
            ),
            Expanded(
              child: Container(
                height: 200,
                child:
                Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    '나랑 같이 해요!',
                    style: TextStyle(
                    fontSize: 20, // Set the desired font size
                    fontWeight: FontWeight.bold
                    )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'asset/img/fig${1}.jpg',
                        height: 70,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        'asset/img/fig${2}.jpg',
                        height: 70,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        'asset/img/fig${3}.jpg',
                        height: 70,
                      )
                    ],

                  ),
                  Column(
                    children: [
                      Text(
                          '성장까지 필요 경험치'
                      ),
                      Container(
                        height: 10,
                        color: Colors.green,
                      ),
                      Text(
                          '${13}:${13}/${13}:${13}'
                      ),
                          ]

                  ),
                ],

              )
            )
            )
          ],

      )
      ),
       const SizedBox(
        height: 20,
      ),
       Container(
            alignment: Alignment.centerLeft,
            child:
            Text(
                '펫 도감',
                style: TextStyle(
                    fontSize: 20, // Set the desired font size
                    fontWeight: FontWeight.bold
                )
            )
      ),

       Expanded(
        child:
        Container(
          height: MediaQuery.of(context).size.height / 2,
          color: Colors.grey,
          alignment: Alignment.center,
          child: CustomScreen(
            onImageTap: (newPath) {
              changeImage(newPath); // 클릭한 이미지 경로를 받아 이미지 변경
            },
          )
        )
      )
      ],
    )
    );

  }
}