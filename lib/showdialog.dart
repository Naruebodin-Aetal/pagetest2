import 'package:flutter/material.dart';
import 'video.dart';

//BuildContext คือกุญแจสำหรับเชื่อมโยงและเข้าถึงข้อมูลหรือฟังก์ชันต่าง ๆ ใน Widget tree ของ Flutter
void showMessageDialog(BuildContext context, String title, String message, AssetImage image) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(image: image, height: 200, width: 220, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(message),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

//BuildContext คือกุญแจสำหรับเชื่อมโยงและเข้าถึงข้อมูลหรือฟังก์ชันต่าง ๆ ใน Widget tree ของ Flutter
void showMessageDialog2(BuildContext context, String title, String message, Widget videoPlayer, AssetImage image) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 300,
              height: 200,
              child: videoPlayer,
            ),
            SizedBox(height: 16),
            Text(message),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}


class Info {
  final String title;
  final String message;
  final AssetImage image;

  Info({required this.title, required this.message, required this.image});
}

class Info2 {
  final String title;
  final String message;
  final AssetImage image;
  final Widget videoPlayer;

  Info2({required this.title, required this.message, required this.image, required this.videoPlayer});
}

List<Info> info_vegetable_List = [
  Info(
    title: 'กำแพงเมืองจีน (Great Wall of China)',
    message: '  เป็นกำแพงที่มีป้อมคั่นเป็นช่วง ๆ ของจีนสมัยโบราณ สร้างขึ้นเพื่อป้องกันการรุกรานจากชนเผ่าต่างๆ ทางตอนเหนือ โดยมีการก่อสร้างต่อเนื่องมาหลายยุคหลายสมัย ปัจจุบันมีความยาวรวมประมาณ 21,196 กิโลเมตร ถือเป็นสิ่งมหัศจรรย์ของโลกและเป็นมรดกโลก',
    image: AssetImage('images/greatwall.jpg'),
  ),
  Info(
    title: 'อนุสาวรีย์เทพีเสรีภาพ (Statue of Liberty)',
    message: '  เป็นประติมากรรมนีโอคลาสสิก ขนาดมหึมาบนเกาะลิเบอร์ตีในท่าเรือนิวยอร์ก ภายในนครนิวยอร์ก รูปปั้นที่หุ้มด้วยทองแดงนี้เป็นของขวัญจากประชาชนชาวฝรั่งเศสที่มอบให้แก่สหรัฐอเมริกา ออกแบบโดยประติมากรชาวฝรั่งเศส เฟรเดริก โอกุสต์ บาร์โตลดี และมีโครงสร้างโลหะที่สร้างโดย กุสตาฟ ไอเฟล ',
    image: AssetImage('images/newyork.jpg'),
  ),
  Info(
    title: 'หอไอเฟล (Eiffel Tower)',
    message: 'เป็นหอคอยโครงเหล็กที่ตั้งอยู่ในกรุงปารีส ประเทศฝรั่งเศส สร้างขึ้นโดย กุสตาฟ ไอเฟล ในปี ค.ศ. 1887–1889 เพื่อเป็นสัญลักษณ์ของงานแสดงสินค้าโลกปี 1889 และเป็นสิ่งก่อสร้างที่สูงสุดในปารีส ด้วยความสูงปัจจุบันประมาณ 330 เมตร (1,083 ฟุต) แบ่งออกเป็น 3 ชั้น มีทั้งร้านอาหาร, ร้านค้า, และจุดชมวิวที่สามารถมองเห็นวิวทิวทัศน์ของกรุงปารีสได้',
    image: AssetImage('images/paris.jpg'),
  ),
  Info(
    title: 'มาชูปิกชู (Machu Picchu)',
    message: '  รู้จักในชื่อ "เมืองสาบสูญแห่งอินคา" ตั้งอยู่บนยอดเขาในเทือกเขาแอนดีส ประเทศเปรู สร้างขึ้นในศตวรรษที่ 15 และถูกทิ้งร้างในช่วงการล่าอาณานิคมของสเปน ปัจจุบันได้รับการขึ้นทะเบียนเป็นมรดกโลกจากองค์การยูเนสโก',
    image: AssetImage('images/Peru.jpg'),
  ),
  Info(
    title: 'พีระมิดแห่งกิซ่า (Pyramids of Giza)',
    message: '  เป็นกลุ่มพีระมิดที่ตั้งอยู่ในเมืองกิซ่า ประเทศอียิปต์ ซึ่งเป็นหนึ่งในเจ็ดสิ่งมหัศจรรย์ของโลกสมัยโบราณ พีระมิดที่มีชื่อเสียงที่สุดคือ พีระมิดของฟาโรห์คูฟู (Khufu) ที่สร้างขึ้นในช่วงประมาณ 2580–2560 ปีก่อนคริสตกาล',
    image: AssetImage('images/pyramids-giza.jpg')
  ),
  Info(
    title: 'โคลอสเซียม (Colosseum)',
    message: '  เป็นสนามกีฬากลางแจ้งที่ตั้งอยู่ในกรุงโรม ประเทศอิตาลี สร้างขึ้นในศตวรรษที่ 1 เพื่อใช้ในการต่อสู้ของนักรบและการแสดงต่างๆ ถือเป็นหนึ่งในสัญลักษณ์ที่สำคัญของกรุงโรม',
    image: AssetImage('images/rome.jpg')
  ),
];

List<Info2> info_exercise_List = [
  Info2(
    title: 'air bicycle',
    message: 'ปั่นจักรยานอากาศ เป็นท่าออกกำลังกายที่ช่วย กระชับหน้าท้องและเอว ได้อย่างมีประสิทธิภาพ ท่านี้เสริมสร้างกล้ามเนื้อ หน้าท้องตรงและเฉียง พร้อมทั้ง สะโพกและต้นขา ช่วย เผาผลาญไขมันรอบเอว และพัฒนาความแข็งแรงของ แกนกลางลำตัว ทำให้ร่างกายมีความสมดุลและแข็งแรงมากขึ้น',
    image: AssetImage('assets/images/exercise_img/air_bicycle.png'),
    videoPlayer: MyNetworkVideoPlayer(videoUrl: 'assets/video/air_bicycle.mp4'),
  ),
  Info2(
    title: 'burpee',
    message: 'เป็นท่าออกกำลังกายแบบ คาร์ดิโอและเวทเทรนนิ่งผสม ที่ช่วย เสริมความแข็งแรงร่างกายทั้งตัว ตั้งแต่แขน ไหล่ หน้าอก หน้าท้อง สะโพก และขา ท่านี้ช่วย เพิ่มความฟิตและความอดทนของหัวใจและปอด พร้อมทั้ง เผาผลาญแคลอรีได้สูง ทำให้ลดไขมันและปรับสัดส่วนได้อย่างรวดเร็ว',
    image: AssetImage('assets/images/exercise_img/burpee.png'),
    videoPlayer: MyNetworkVideoPlayer(videoUrl: 'assets/video/burpee.mp4'),
  ),
  Info2(
    title: 'crunch',
    message: 'เป็นท่าออกกำลังกายที่เน้น กล้ามเนื้อหน้าท้องตรง ช่วยให้หน้าท้องกระชับและแข็งแรง ท่านี้ยังช่วย ปรับท่าทางของร่างกาย และเสริมความมั่นคงของ แกนกลางลำตัว (core stability) ทำให้การเคลื่อนไหวประจำวันมีประสิทธิภาพมากขึ้น',
    image: AssetImage('assets/images/exercise_img/crunch.png'),
    videoPlayer: MyNetworkVideoPlayer(videoUrl: 'assets/video/crunch.mp4'),
  ),
  Info2(
    title: 'high knee',
    message: 'เป็นท่าที่ช่วย กระตุ้นหัวใจและปอด อย่างมีประสิทธิภาพ พร้อมกับ เสริมความแข็งแรงต้นขาและสะโพก การยกเข่าสูงช่วย เผาผลาญแคลอรี และพัฒนาความ เร็วและความคล่องตัว ของร่างกาย ทำให้ร่างกายฟิตกระชับและเคลื่อนไหวคล่องตัวมากขึ้น',
    image: AssetImage('assets/images/exercise_img/high_knee.png'),
    videoPlayer: MyNetworkVideoPlayer(videoUrl: 'assets/video/high_knee.mp4'),
  ),
  Info2(
    title: 'jumping jack',
    message: 'เป็นท่าที่ช่วย กระตุ้นระบบหัวใจและหลอดเลือด และ เพิ่มความยืดหยุ่นของร่างกาย การกระโดดสลับขาและกางแขนช่วย เผาผลาญพลังงาน เสริมความคล่องตัว และช่วย อบอุ่นร่างกาย ก่อนออกกำลังกายท่าอื่น ๆ',
    image: AssetImage('assets/images/exercise_img/jumping_jack.png'),
    videoPlayer: MyNetworkVideoPlayer(videoUrl: 'assets/video/jumping_jack.mp4'),
  ),
  Info2(
    title: 'mountain climber',
    message: 'เป็นท่าที่ช่วย เสริมความแข็งแรงของแกนกลางลำตัว (core) พร้อมกับ กล้ามเนื้อแขน ขา และสะโพก การเคลื่อนไหวแบบสลับขาช่วย เผาผลาญแคลอรีและเพิ่มความทนทานของหัวใจและปอด ทำให้ร่างกายกระชับ ฟิต และคล่องตัวมากขึ้น',
    image: AssetImage('assets/images/exercise_img/mountain_climber.png'),
    videoPlayer: MyNetworkVideoPlayer(videoUrl: 'assets/video/mountain_climber.mp4'),
  ),
  Info2(
    title: 'plank',
    message: 'เป็นท่าที่เน้น ความแข็งแรงของแกนกลางลำตัว (core stability) ช่วยเสริม กล้ามเนื้อหน้าท้อง หลัง และไหล่ การถือท่านี้เป็นเวลานานช่วย ปรับท่าทางของร่างกาย เพิ่มความทนทานของกล้ามเนื้อ และทำให้ร่างกายสมดุลและมั่นคงมากขึ้น',
    image: AssetImage('assets/images/exercise_img/plank.png'),
    videoPlayer: MyNetworkVideoPlayer(videoUrl: 'assets/video/plank.mp4'),
  ),
  Info2(
    title: 'push up',
    message: 'เป็นท่าที่ช่วย เสริมความแข็งแรงของหน้าอก ไหล่ แขน และแกนกลางลำตัว การออกแรงดันตัวขึ้นลงช่วย เพิ่มความทนทานของกล้ามเนื้อ และปรับท่าทางให้แข็งแรงสมดุล นอกจากนี้ยังช่วย เผาผลาญแคลอรี และพัฒนาความฟิตโดยรวมของร่างกาย',
    image: AssetImage('assets/images/exercise_img/push_up.png'),
    videoPlayer: MyNetworkVideoPlayer(videoUrl: 'assets/video/push_up.mp4'),
  ),
  Info2(
    title: 'reverse_crunch',
    message: 'เป็นท่าที่เน้น กล้ามเนื้อหน้าท้องล่าง ช่วยกระชับเอวและหน้าท้อง การยกขาขึ้นและดึงเข้าหาลำตัวช่วย เสริมความแข็งแรงแกนกลางลำตัว (core) และปรับสัดส่วนให้เอวคอด นอกจากนี้ยังช่วย เผาผลาญไขมันรอบเอว และพัฒนาความมั่นคงของร่างกาย',
    image: AssetImage('assets/images/exercise_img/reverse_crunch.png'),
    videoPlayer: MyNetworkVideoPlayer(videoUrl: 'assets/video/reverse_crunch.mp4'),
  ),
  Info2(
    title: 'squats',
    message: 'เป็นท่าที่ช่วย เสริมความแข็งแรงของต้นขา สะโพก และหน้าท้อง การงอเข่าและลำตัวลงขึ้นช่วย กระชับกล้ามเนื้อส่วนล่าง และเพิ่ม ความมั่นคงของข้อเข่าและสะโพก นอกจากนี้ยังช่วย เผาผลาญพลังงาน และพัฒนาความฟิตโดยรวมของร่างกาย',
    image: AssetImage('assets/images/exercise_img/squats.png'),
    videoPlayer: MyNetworkVideoPlayer(videoUrl: 'assets/video/squats.mp4'),
  ),

];