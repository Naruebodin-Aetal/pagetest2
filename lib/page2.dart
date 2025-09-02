import 'package:flutter/material.dart';
import 'showdialog.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page2'),
      ),
      body: MyTabPage(),
    );
  }
}

class MyTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'Vegetable', icon: Icon(Icons.forest_rounded)),
              Tab(text: 'Exercise', icon: Icon(Icons.fitness_center)),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                VegetablePage(),
                ExercisePage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VegetablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( //การกำหนดรูปแบบการจัดวาง grid ใน GridView ของ Flutter โดยใช้จำนวนคอลัมน์ที่แน่นอน (fixed number of columns)
            crossAxisCount: 2, //grid มี 2 คอลัมน์
            childAspectRatio: 0.8, //กำหนดอัตราส่วนกว้าง/สูงของแต่ละช่อง
          ),
          itemCount: info_vegetable_List.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
                child: InkWell(
                onTap: () {
                  showMessageDialog(
                    context,
                    info_vegetable_List[index].title,
                    info_vegetable_List[index].message,
                    info_vegetable_List[index].image,
                  );
                },
                  child: Ink.image(
                  image: info_vegetable_List[index].image,
                  fit: BoxFit.cover,)
              ),
            );
          },
        ),
    );
  }
}

class ExercisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( //การกำหนดรูปแบบการจัดวาง grid ใน GridView ของ Flutter โดยใช้จำนวนคอลัมน์ที่แน่นอน (fixed number of columns)
            crossAxisCount: 2, //grid มี 2 คอลัมน์
            childAspectRatio: 0.8, //กำหนดอัตราส่วนกว้าง/สูงของแต่ละช่อง
          ),
          itemCount: info_exercise_List.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
                child: InkWell(
                onTap: () {
                  showMessageDialog(
                    context,
                    info_exercise_List[index].title,
                    info_exercise_List[index].message,
                    info_exercise_List[index].image,
                  );
                },
                  child: Ink.image(
                  image: info_vegetable_List[index].image,
                  fit: BoxFit.cover,)
              ),
            );
          },
        ),
    );
  }
}

