import 'package:flutter/material.dart';

import '../data/subway_repository_impl.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _textController = TextEditingController();
  final subwayRepository = SubwayInfoRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('서울 지하철 근처역 찾기'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textController,
            decoration: InputDecoration(
              hintText: '역 이름을 입력해주세요',
            ),
          ),
          ListView(children: [

          ]),
          // ListView.builder(itemBuilder: (context, index)  {
          //   final subwayList = await subwayRepository.getSubwayInfo(_textController.text);
          //   return ListTile(
          //     title: subwayList[index]
          //   );
          //
          // },)
        ],
      ),
    );
  }
}
