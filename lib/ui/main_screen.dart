import 'package:flutter/material.dart';

import '../data/subway_repository_impl.dart';
import 'main_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mainViewModel = context.watch<SubwayViewModel>();
    final state = mainViewModel.state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('서울 지하철역 도착정보'),
        elevation: 2,
        shadowColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                hintText: '역 이름을 입력해주세요',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    mainViewModel.searchSubwayInfo(_textController.text);
                  },
                ),
              ),
            ),
            state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView(
                      children: state.subwayInfoLists
                          .map(
                            (e) => Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    margin: const EdgeInsets.all(8),
                                    width: MediaQuery.of(context).size.width / 4,
                                    child: Text(e.arrivalInfo),
                                  ),
                                  title: Text(e.station),
                                  subtitle: Text(e.direction),
                                  trailing: Container(
                                    margin: const EdgeInsets.all(8),
                                    width: MediaQuery.of(context).size.width / 4,
                                    child: Text(e.platform),
                                  ),
                                ),
                                const Divider(
                                  color: Colors.purple, // Set the color you want for the bottom border
                                  height: 0.5, // Adjust the height of the border
                                  thickness: 1, // Adjust the thickness of the border

                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),

            // ListView.builder(itemBuilder: (context, index)  {
            //   final subwayList = await subwayRepository.getSubwayInfo(_textController.text);
            //   return ListTile(
            //     title: subwayList[index]
            //   );
            //
            // },)
          ],
        ),
      ),
    );
  }
}
