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
    title: '🍅 มะเขือเทศ',
    message: 'มะเขือเทศมีสารไลโคปีน วิตามินเอ วิตามินซี และสารต้านอนุมูลอิสระสูง ซึ่งช่วยชะลอความเสื่อมของเซลล์ในร่างกาย ลดความเสี่ยงโรคหัวใจและมะเร็ง บำรุงสายตาและผิวพรรณ เสริมภูมิคุ้มกัน ควบคุมความดันโลหิต และยังช่วยให้ระบบย่อยอาหารทำงานได้ดีขึ้น',
    image: AssetImage('assets/images/vegetable_img/tomato.jpg'),
  ),
  Info(
    title: '🥦 บรอกโคลี',
    message: 'บรอกโคลีเป็นผักที่อุดมไปด้วยวิตามินซี วิตามินเค กรดโฟลิก ใยอาหาร และสารต้านอนุมูลอิสระอย่างซัลโฟราเฟน (Sulforaphane) ซึ่งมีคุณสมบัติช่วยลดการอักเสบและป้องกันเซลล์ถูกทำลาย โดยบร็อกโคลีช่วยเสริมสร้างภูมิคุ้มกัน บำรุงกระดูกและฟันให้แข็งแรง ควบคุมระดับน้ำตาลในเลือด ลดคอเลสเตอรอลในร่างกาย และยังมีส่วนช่วยลดความเสี่ยงของโรคมะเร็งและโรคหัวใจ อีกทั้งใยอาหารยังช่วยให้ระบบขับถ่ายทำงานได้ดีขึ้น เหมาะสำหรับคนที่ต้องการดูแลสุขภาพในหลาย ๆ ด้านพร้อมกัน',
    image: AssetImage('assets/images/vegetable_img/brocoli.jpg'),
  ),
  Info(
    title: '🥕 แคร์รอต',
    message: 'แคร์รอตเป็นผักที่อุดมไปด้วย เบต้าแคโรทีน ซึ่งร่างกายสามารถเปลี่ยนเป็นวิตามินเอได้ ช่วยบำรุงสายตา ลดความเสี่ยงโรคต้อกระจกและจอประสาทตาเสื่อม นอกจากนี้ยังมีวิตามินซี วิตามินเค โพแทสเซียม และใยอาหารสูง ที่ช่วยเสริมภูมิคุ้มกัน บำรุงกระดูกและฟัน ควบคุมความดันโลหิต ช่วยให้ระบบขับถ่ายทำงานได้ดี อีกทั้งสารต้านอนุมูลอิสระในแคร์รอตยังมีส่วนช่วยลดการอักเสบ ป้องกันความเสื่อมของเซลล์ และลดความเสี่ยงโรคหัวใจและมะเร็งได้อีกด้วย',
    image: AssetImage('assets/images/vegetable_img/carrot.jpg'),
  ),
  Info(
    title: '🌿 ผักบุ้ง',
    message: 'ผักบุ้งเป็นผักที่คนไทยนิยมมาก ทั้งผัด ต้ม หรือลวกจิ้มน้ำพริก โดยผักบุ้งมี เบต้าแคโรทีน วิตามินเอ วิตามินซี ธาตุเหล็ก แคลเซียม และใยอาหารสูง ซึ่งช่วยบำรุงสายตา ลดความเสี่ยงโรคตาเสื่อม บำรุงผิวพรรณ เสริมภูมิคุ้มกัน และช่วยให้ร่างกายต้านอนุมูลอิสระได้ดีขึ้น นอกจากนี้ยังช่วยบำรุงเลือด ป้องกันภาวะโลหิตจาง ทำให้ระบบขับถ่ายทำงานดีขึ้น ลดอาการท้องผูก และยังเป็นผักที่มีน้ำมาก จึงช่วยให้ร่างกายสดชื่น เหมาะกับอากาศร้อน ๆ ของบ้านเราอีกด้วย',
    image: AssetImage('assets/images/vegetable_img/pakbung.jpg'),
  ),
  Info(
    title: '🎃 ฟักทอง',
    message: 'ฟักทองเป็นผักที่มีสารอาหารหลากหลาย โดยเฉพาะ เบต้าแคโรทีน วิตามินเอ วิตามินซี ใยอาหาร และโพแทสเซียม ซึ่งมีประโยชน์หลายด้าน ได้แก่ บำรุงสายตา ลดความเสี่ยงการเกิดโรคจอประสาทตาเสื่อม เสริมภูมิคุ้มกันให้ร่างกายแข็งแรง ช่วยให้ผิวพรรณสดใสและชะลอความเสื่อมของเซลล์ อีกทั้งยังมีใยอาหารที่ช่วยให้ระบบขับถ่ายทำงานได้ดี ป้องกันท้องผูก และช่วยควบคุมน้ำหนัก นอกจากนี้สารต้านอนุมูลอิสระในฟักทองยังช่วยลดการอักเสบ และลดความเสี่ยงโรคหัวใจและมะเร็งได้อีกด้วย',
    image: AssetImage('assets/images/vegetable_img/pumpkin.jpg')
  ),
  Info(
    title: '🥬 ผักกาดหอม',
    message: 'ผักกาดหอมเป็นผักใบเขียวที่มี น้ำสูง วิตามินเอ วิตามินเค และใยอาหาร ช่วยบำรุงสายตา ลดความดันโลหิต เสริมภูมิคุ้มกัน ทำให้ร่างกายสดชื่น และช่วยให้ระบบขับถ่ายทำงานได้ดี นอกจากนี้ยังช่วยให้ร่างกายผ่อนคลาย เหมาะสำหรับกินสดหรือทำสลัด',
    image: AssetImage('assets/images/vegetable_img/pakkadhom.jpg')
  ),
  Info(
    title: '🥬 กวางตุ้ง',
    message: 'กวางตุ้งเป็นผักที่อุดมไปด้วย วิตามินเอ วิตามินซี แคลเซียม และโพแทสเซียม ช่วยบำรุงกระดูกและฟัน ลดความเสี่ยงการเกิดโรคกระดูกพรุน เสริมภูมิคุ้มกัน ลดความดันโลหิต และช่วยให้ผิวพรรณสดใส นิยมกินทั้งผัด ลวก หรือต้ม',
    image: AssetImage('assets/images/vegetable_img/kwangtung.jpg')
  ),
  Info(
    title: '🥒 แตงกวา',
    message: 'แตงกวาเป็นผักน้ำที่มี น้ำมากถึง 95% และมีวิตามินเค วิตามินซี ใยอาหาร และแร่ธาตุต่าง ๆ ซึ่งช่วยให้ร่างกายสดชื่นและชุ่มชื้น ลดความร้อนในร่างกาย ช่วยขับของเสียและสารพิษออกจากร่างกาย บำรุงผิวพรรณให้ชุ่มชื้น ลดอาการบวม และช่วยควบคุมความดันโลหิต นอกจากนี้ใยอาหารในแตงกวายังช่วยให้ระบบขับถ่ายทำงานดี ลดอาการท้องผูก และสารต้านอนุมูลอิสระในแตงกวาช่วยลดการอักเสบ ป้องกันความเสื่อมของเซลล์',
    image: AssetImage('assets/images/vegetable_img/pickle.jpg')
  ),
  Info(
    title: '🌿 ผักชี',
    message: 'ผักชีเป็นผักสมุนไพรที่มี วิตามินเอ วิตามินซี ธาตุเหล็ก แคลเซียม และแมกนีเซียม ซึ่งช่วยเสริมภูมิคุ้มกัน บำรุงสายตาและผิวพรรณ ลดการอักเสบในร่างกาย และช่วยบำรุงเลือด ป้องกันภาวะโลหิตจาง นอกจากนี้ผักชายังช่วยกระตุ้นการย่อยอาหาร ขับลม ลดอาการท้องอืด และช่วยให้ระบบขับถ่ายทำงานดีขึ้น กลิ่นหอมของผักชียังช่วยกระตุ้นความอยากอาหารและทำให้อาหารรสชาติกลมกล่อมยิ่งขึ้น',
    image: AssetImage('assets/images/vegetable_img/pakshe.jpg')
  ),
  Info(
    title: '🌱 ถั่วงอก',
    message: 'ถั่วงอกเป็นผักที่อุดมไปด้วย วิตามินซี ใยอาหาร โปรตีนจากพืช และแร่ธาตุต่าง ๆ ซึ่งมีประโยชน์หลายด้าน เช่น การเสริมภูมิคุ้มกันให้ร่างกายแข็งแรง ช่วยกระตุ้นการทำงานของระบบขับถ่าย ลดอาการท้องผูก และช่วยให้ร่างกายขับของเสียออกได้ดี  ด้วยคุณสมบัติที่มีแคลอรีต่ำและน้ำสูง ถั่วงอกจึงเหมาะสำหรับผู้ที่ต้องการควบคุมน้ำหนักและรักษาสุขภาพผิวพรรณ นิยมกินสด ผัด หรือต้มใส่แกงและก๋วยเตี๋ยว',
    image: AssetImage('assets/images/vegetable_img/Bean_Sprouts.jpg')
  )
];

List<Info> info_fruit_List = [
  Info(
    title: '🍎 แอปเปิ้ล',
    message: 'แอปเปิ้ลมีสารต้านอนุมูลอิสระ วิตามินซี และใยอาหารสูง ซึ่งช่วยลดความเสี่ยงโรคหัวใจและมะเร็ง บำรุงผิวพรรณ เสริมภูมิคุ้มกัน ควบคุมระดับน้ำตาลในเลือด และช่วยให้ระบบขับถ่ายทำงานได้ดีขึ้น',
    image: AssetImage('assets/images/fruit_img/apple.jpg'),
  ),
  Info(
    title: '🍌 กล้วย',
    message: 'กล้วยเป็นผลไม้ที่มีโพแทสเซียม วิตามินบี6 และใยอาหารสูง ซึ่งช่วยควบคุมความดันโลหิต ลดความเสี่ยงโรคหัวใจ บำรุงสมองและระบบประสาท เสริมภูมิคุ้มกัน และช่วยให้ระบบขับถ่ายทำงานได้ดีขึ้น',
    image: AssetImage('assets/images/fruit_img/banana.jpg'),
  ),
  Info(
    title: '🍊 ส้ม',
    message: 'ส้มเป็นผลไม้ที่มีวิตามินซี ใยอาหาร และสารต้านอนุมูลอิสระสูง ซึ่งช่วยเสริมภูมิคุ้มกัน ลดการอักเสบในร่างกาย บำรุงผิวพรรณ ป้องกันโรคหวัด และช่วยให้ระบบขับถ่ายทำงานได้ดีขึ้น',
    image: AssetImage('assets/images/fruit_img/orange.jpg'),
  ),
  Info(
    title: '🍓 สตรอว์เบอร์รี',
    message: 'สตรอว์เบอร์รีเป็นผลไม้ที่มีวิตามินซี แมงกานีส และสารต้านอนุมูลอิสระสูง ซึ่งช่วยเสริมภูมิคุ้มกัน ลดการอักเสบในร่างกาย บำรุงผิวพรรณ ป้องกันโรคหัวใจ และช่วยให้ระบบขับถ่ายทำงานได้ดีขึ้น',
    image: AssetImage('assets/images/fruit_img/strawberry.jpg'),
  ),
  Info(
    title: '🍍 สับปะรด',
    message: 'สับปะรดเป็นผลไม้ที่มีวิตามินซี เอนไซม์โบรมีเลน และสารต้านอนุมูลอิสระสูง ซึ่งช่วยเสริมภูมิคุ้มกัน ลดการอักเสบในร่างกาย บำรุงผิวพรรณ และช่วยให้ระบบขับถ่ายทำงานได้ดีขึ้น',
    image: AssetImage('assets/images/fruit_img/pineaple.png'),
  ),
  Info(
    title: '🥭 มะม่วง',
    message: 'มะม่วงเป็นผลไม้ที่มีวิตามินเอ วิตามินซี และใยอาหารสูง ซึ่งช่วยบำรุงสายตา เสริมภูมิคุ้มกัน บำรุงผิวพรรณ และช่วยให้ระบบขับถ่ายทำงานได้ดีขึ้น',
    image: AssetImage('assets/images/fruit_img/Mango.jpeg'),
  ),
  Info(
    title: '🍉 แตงโม',
    message: 'แตงโมเป็นผลไม้ที่มีน้ำสูง วิตามินซี และสารต้านอนุมูลอิสระ ซึ่งช่วยให้ร่างกายสดชื่นและชุ่มชื้น ลดความร้อนในร่างกาย บำรุงผิวพรรณ และช่วยให้ระบบขับถ่ายทำงานได้ดีขึ้น',
    image: AssetImage('assets/images/fruit_img/watermelon.jpg'),
  ),
  Info(
    title: '🍇 องุ่น',
    message: 'องุ่นเป็นผลไม้ที่มีสารต้านอนุมูลอิสระ วิตามินซี และใยอาหารสูง ซึ่งช่วยลดความเสี่ยงโรคหัวใจและมะเร็ง บำรุงผิวพรรณ เสริมภูมิคุ้มกัน และช่วยให้ระบบขับถ่ายทำงานได้ดีขึ้น',
    image: AssetImage('assets/images/fruit_img/grapes.jpg'),
  ),
  Info(
    title: '🥝 กีวี',
    message: 'กีวีเป็นผลไม้ที่มีวิตามินซี วิตามินเค และใยอาหารสูง ซึ่งช่วยเสริมภูมิคุ้มกัน ลดการอักเสบในร่างกาย บำรุงผิวพรรณ ป้องกันโรคหัวใจ และช่วยให้ระบบขับถ่ายทำงานได้ดีขึ้น',
    image: AssetImage('assets/images/fruit_img/kiwi.jpg'),
  ),
  Info(
    title: '🍒 เชอร์รี่',
    message: 'เชอร์รี่เป็นผลไม้ที่มีสารต้านอนุมูลอิสระ วิตามินซี และใยอาหารสูง ซึ่งช่วยลดการอักเสบในร่างกาย บำรุงผิวพรรณ ป้องกันโรคหัวใจ และช่วยให้ระบบขับถ่ายทำงานได้ดีขึ้น',
    image: AssetImage('assets/images/fruit_img/sherry.jpg'),
  ),
];

List<Info2> info_exercise_List = [
  Info2(
    title: 'air bicycle',
    message: 'ปั่นจักรยานอากาศ เป็นท่าออกกำลังกายที่ช่วย กระชับหน้าท้องและเอว ได้อย่างมีประสิทธิภาพ ท่านี้เสริมสร้างกล้ามเนื้อ หน้าท้องตรงและเฉียง พร้อมทั้ง สะโพกและต้นขา ช่วย เผาผลาญไขมันรอบเอว และพัฒนาความแข็งแรงของ แกนกลางลำตัว ทำให้ร่างกายมีความสมดุลและแข็งแรงมากขึ้น',
    image: AssetImage('assets/images/exercise_img/air_bicycle.png'),
    videoPlayer: MyVideoPlayer(videoPath: 'assets/video/air_bicycle.mp4'),
  ),
  Info2(
    title: 'burpee',
    message: 'เป็นท่าออกกำลังกายแบบ คาร์ดิโอและเวทเทรนนิ่งผสม ที่ช่วย เสริมความแข็งแรงร่างกายทั้งตัว ตั้งแต่แขน ไหล่ หน้าอก หน้าท้อง สะโพก และขา ท่านี้ช่วย เพิ่มความฟิตและความอดทนของหัวใจและปอด พร้อมทั้ง เผาผลาญแคลอรีได้สูง ทำให้ลดไขมันและปรับสัดส่วนได้อย่างรวดเร็ว',
    image: AssetImage('assets/images/exercise_img/burpee.png'),
    videoPlayer: MyVideoPlayer(videoPath: 'assets/video/burpee.mp4'),
  ),
  Info2(
    title: 'crunch',
    message: 'เป็นท่าออกกำลังกายที่เน้น กล้ามเนื้อหน้าท้องตรง ช่วยให้หน้าท้องกระชับและแข็งแรง ท่านี้ยังช่วย ปรับท่าทางของร่างกาย และเสริมความมั่นคงของ แกนกลางลำตัว (core stability) ทำให้การเคลื่อนไหวประจำวันมีประสิทธิภาพมากขึ้น',
    image: AssetImage('assets/images/exercise_img/crunch.png'),
    videoPlayer: MyVideoPlayer(videoPath: 'assets/video/crunch.mp4'),
  ),
  Info2(
    title: 'high knee',
    message: 'เป็นท่าที่ช่วย กระตุ้นหัวใจและปอด อย่างมีประสิทธิภาพ พร้อมกับ เสริมความแข็งแรงต้นขาและสะโพก การยกเข่าสูงช่วย เผาผลาญแคลอรี และพัฒนาความ เร็วและความคล่องตัว ของร่างกาย ทำให้ร่างกายฟิตกระชับและเคลื่อนไหวคล่องตัวมากขึ้น',
    image: AssetImage('assets/images/exercise_img/high_knee.png'),
    videoPlayer: MyVideoPlayer(videoPath: 'assets/video/high_knee.mp4'),
  ),
  Info2(
    title: 'jumping jack',
    message: 'เป็นท่าที่ช่วย กระตุ้นระบบหัวใจและหลอดเลือด และ เพิ่มความยืดหยุ่นของร่างกาย การกระโดดสลับขาและกางแขนช่วย เผาผลาญพลังงาน เสริมความคล่องตัว และช่วย อบอุ่นร่างกาย ก่อนออกกำลังกายท่าอื่น ๆ',
    image: AssetImage('assets/images/exercise_img/jumping_jack.png'),
    videoPlayer: MyVideoPlayer(videoPath: 'assets/video/jumping_jack.mp4'),
  ),
  Info2(
    title: 'mountain climber',
    message: 'เป็นท่าที่ช่วย เสริมความแข็งแรงของแกนกลางลำตัว (core) พร้อมกับ กล้ามเนื้อแขน ขา และสะโพก การเคลื่อนไหวแบบสลับขาช่วย เผาผลาญแคลอรีและเพิ่มความทนทานของหัวใจและปอด ทำให้ร่างกายกระชับ ฟิต และคล่องตัวมากขึ้น',
    image: AssetImage('assets/images/exercise_img/mountain_climber.png'),
    videoPlayer: MyVideoPlayer(videoPath: 'assets/video/mountain_climber.mp4'),
  ),
  Info2(
    title: 'plank',
    message: 'เป็นท่าที่เน้น ความแข็งแรงของแกนกลางลำตัว (core stability) ช่วยเสริม กล้ามเนื้อหน้าท้อง หลัง และไหล่ การถือท่านี้เป็นเวลานานช่วย ปรับท่าทางของร่างกาย เพิ่มความทนทานของกล้ามเนื้อ และทำให้ร่างกายสมดุลและมั่นคงมากขึ้น',
    image: AssetImage('assets/images/exercise_img/plank.png'),
    videoPlayer: MyVideoPlayer(videoPath: 'assets/video/plank.mp4'),
  ),
  Info2(
    title: 'push up',
    message: 'เป็นท่าที่ช่วย เสริมความแข็งแรงของหน้าอก ไหล่ แขน และแกนกลางลำตัว การออกแรงดันตัวขึ้นลงช่วย เพิ่มความทนทานของกล้ามเนื้อ และปรับท่าทางให้แข็งแรงสมดุล นอกจากนี้ยังช่วย เผาผลาญแคลอรี และพัฒนาความฟิตโดยรวมของร่างกาย',
    image: AssetImage('assets/images/exercise_img/push_up.png'),
    videoPlayer: MyVideoPlayer(videoPath: 'assets/video/push_up.mp4'),
  ),
  Info2(
    title: 'reverse crunch',
    message: 'เป็นท่าที่เน้น กล้ามเนื้อหน้าท้องล่าง ช่วยกระชับเอวและหน้าท้อง การยกขาขึ้นและดึงเข้าหาลำตัวช่วย เสริมความแข็งแรงแกนกลางลำตัว (core) และปรับสัดส่วนให้เอวคอด นอกจากนี้ยังช่วย เผาผลาญไขมันรอบเอว และพัฒนาความมั่นคงของร่างกาย',
    image: AssetImage('assets/images/exercise_img/reverse_crunch.png'),
    videoPlayer: MyVideoPlayer(videoPath: 'assets/video/reverse_crunch.mp4'),
  ),
  Info2(
    title: 'squats',
    message: 'เป็นท่าที่ช่วย เสริมความแข็งแรงของต้นขา สะโพก และหน้าท้อง การงอเข่าและลำตัวลงขึ้นช่วย กระชับกล้ามเนื้อส่วนล่าง และเพิ่ม ความมั่นคงของข้อเข่าและสะโพก นอกจากนี้ยังช่วย เผาผลาญพลังงาน และพัฒนาความฟิตโดยรวมของร่างกาย',
    image: AssetImage('assets/images/exercise_img/squats.png'),
    videoPlayer: MyVideoPlayer(videoPath: 'assets/video/squats.mp4'),
  ),

];