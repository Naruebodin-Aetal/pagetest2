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
            return InkWell(
            onTap: () {
              showMessageDialog(
                context,
                info_vegetable_List[index].title,
                info_vegetable_List[index].message,
                info_vegetable_List[index].image,
              );
            },
              child: Card(
                child: Ink.image(
                image: info_vegetable_List[index].image,
                fit: BoxFit.cover,),
              )
                          );
          },
        ),
    );
  }
}

class ExercisePage extends StatefulWidget {
  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: info_exercise_List.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            elevation: 4,
            child: InkWell(
              onTap: () {
                showMessageDialog2(
                  context,
                  info_exercise_List[index].title,
                  info_exercise_List[index].message,
                  info_exercise_List[index].videoPlayer,
                  info_exercise_List[index].image,
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipOval(
                      child: Image(
                        image: info_exercise_List[index].image,
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          info_exercise_List[index].title,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}