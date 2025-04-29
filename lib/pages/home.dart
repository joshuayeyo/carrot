import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, String>> datas = [];
  late String currentLocation;
  final Map<String, String> locationTypeToString = {
    "banpo1" : "반포 1동",
    "sinsa" : "신사동",
    "daechi1" : "대치 1동"
  };

  @override
  void initState() {
    super.initState();
    currentLocation = "banpo1";
    datas = [
      {
        "image" : "assets/images/ara-1.jpg",
        "title" : "네메시스 축구화275",
        "location" : "서울시 서초구 반포1동",
        "price" : "30000",
        "likes" : "2"
      },
      {
        "image" : "assets/images/ara-2.jpg",
        "title" : "LA갈비 5kg 팔아요",
        "location" : "서울시 서초구 우면동",
        "price" : "100000",
        "likes" : "5"
      },
      {
        "image" : "assets/images/ara-3.jpg",
        "title" : "치약 팝니다",
        "location" : "서울시 서초구 반포3동",
        "price" : "5000",
        "likes" : "0"
      },
      {
        "image" : "assets/images/ara-4.jpg",
        "title" : "[풀박스] 맥북프로 16인치 터치바 스페이스그레이",
        "location" : "서울시 강남구 신사동",
        "price" : "2500000",
        "likes" : "15"
      },
      {
        "image" : "assets/images/ara-5.jpg",
        "title" : "디월트론기임팩",
        "location" : "서울시 강남구 신사동",
        "price" : "150000",
        "likes" : "2"
      },
      {
        "image" : "assets/images/ara-6.jpg",
        "title" : "갤럭시 s10",
        "location" : "서울시 강남구 신사동",
        "price" : "180000",
        "likes" : "2"
      },
      {
        "image" : "assets/images/ara-7.jpg",
        "title" : "선반",
        "location" : "서울시 강남구 신사동",
        "price" : "15000",
        "likes" : "2"
      },
      {
        "image" : "assets/images/ara-8.jpg",
        "title" : "냉장 쇼케이스",
        "location" : "서울시 강남구 신사동",
        "price" : "30000",
        "likes" : "3"
      },
      {
        "image" : "assets/images/ara-9.jpg",
        "title" : "대우 미니냉장고",
        "location" : "서울시 강남구 신사동",
        "price" : "30000",
        "likes" : "3"
      },
      {
        "image" : "assets/images/ara-10.jpg",
        "title" : "멜킨스 풀업 턱걸이 판매합니다.",
        "location" : "서울시 강남구 신사동",
        "price" : "50000",
        "likes" : "2"
      }
    ];
  }

  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          print('click');
        },
        onLongPress: () {
          print('long pressed');
        },
        child: PopupMenuButton<String>(
          offset: Offset(0, 20),  // popup menu 위치 조정
          shape: ShapeBorder.lerp(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              1
          ),
          onSelected: (String where) {
            print(where);
            setState(() {
              currentLocation = where;
            });
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                value: "banpo1", child: Text("반포1동"),
              ),
              PopupMenuItem(
                value: "sinsa", child: Text("신사동"),
              ),
              PopupMenuItem(
                value: "daechi1", child: Text("대치동"),
              ),
            ];
          },
          child: Row(
            children: [
              Text(locationTypeToString[currentLocation]!),
              const Icon(Icons.arrow_drop_down)
            ],
          ),

        )
      ),
      elevation: 1,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.tune),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/svg/Bell.svg", width: 22,
          ),
        ),
      ],
    );
  }

  final oCcy = new NumberFormat("#,###", "ko_KR");
  String calcStringToWon(String priceString) {

    return "${oCcy.format(int.parse(priceString))}원";
  }


  Widget _bodyWidget() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          // margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Image.asset(datas[index]["image"]!, // null safety operator
                  width: 100,
                  height: 100
                )
              ),
              // SizedBox(width: 20),
              Expanded(
                child: Container(
                  height: 100,
                  padding: const EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width - 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        datas[index]["title"]!,
                          overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: 5),
                      Text(
                        datas[index]["location"]!,
                        style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.3)),
                      ),
                      SizedBox(height: 5),
                      Text(
                        calcStringToWon(datas[index]["price"]!),
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 5),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/svg/heart_off.svg",
                              width: 13,
                              height: 13
                            ),
                            SizedBox(
                              width: 5
                            ),
                            Text(datas[index]["likes"]!,),
                            // Padding(
                            //     padding: const EdgeInsets.only(left: 5),
                            //     child: Text(datas[index]["likes"]!,),
                            // ),
                          ],
                        ),
                      )
                    ],
                  )
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext _context, int index) {
        return Container(
          height: 1,
          color: Color(0xff999999),
        );
      },
      itemCount: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }
}