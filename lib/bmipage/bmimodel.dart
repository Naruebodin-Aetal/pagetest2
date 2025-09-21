class Bmimodel {
  String? date;
  double? height;
  double? weight;
  double? bmi;

  String getadviceFood() {
    return bmiDataType[bmiChecker(bmi!)]!.advicefood;
  }
  String getadviceWorkout() {
    return bmiDataType[bmiChecker(bmi!)]!.adviceworkout;
  }

  

  Map<int, BmiData> bmiDataType = {
    1: BmiData(
      advicefood: """
      -กินอาหารครบ 3 มื้อรวมกับของว่าง
      -เพิ่มโปรตีน(เนื้อสัตว์ไม่ติดมัน, ไข่, นม, ถั่ว)
      -เพิ่มคาร์บเชิงซ้อน (ข้าวกล้อง , ธัญพืช, มัน)
      -กินอาหารที่ให้พลังงานมากขึ้นอย่างพอดี
      """,
      adviceworkout: """
      -เน้นเวทเทรนนิ่งเพื่อเพิ่มมวลกล้ามเนื้อ
      -คาร์ดิโอเบาๆ เช่นเดิน, ปั่นจักรยาน 2-3 วันต่อสัปดาห์
      """,
    ),
    2: BmiData(
      advicefood: """
      -รักษาสมดุลอาหาร 5 หมู่ 
      -กินผักและผลไม้เป็นประจำ
      -เลี่ยงของทอดหวานจัดและอาหารแปรรูป
      """,
      adviceworkout: """
      -ออกกำลังกาย 3-5 วันต่อสัปดาห์
      -ผลผสมคาร์ดิโอ(วิ่ง, ว่ายน้ำ, เดินเร็ว) + เวทเทรนนิ่ง
      -เสริมโยคะ/ยืดเหยียดเพื่อสุขภาพ
      """,
    ),
    3: BmiData(
      advicefood: """
      -ลดอาหารที่มันจัด เค็มจัด หวานจัด
      -เพิ่มผัก ผลไม้ และโปรตีนไขมันต่ำ (ปลา, ไก่, เต้าหู้)
      -กินในปริมาณพอดี ไม่กินจุกจิก
      """,
      adviceworkout: """
      -คาร์ดิโอปานกลาง–หนัก 4 วันต่อสัปดาห์ (วิ่ง, ปั่นจักรยาน, HIIT) 
      -เวทเทรนนิ่งเบา–ปานกลาง 2-3 วันต่อสัปดาห์
      """,
    ),
    4: BmiData(
      advicefood: """
      -ควบคุมอาหารอย่างเคร่งครัด 
      -ลดอาหารที่มันจัด เค็มจัด ของหวาน
      -เน้นอาหารธรรมชาติ ผักและโปรตีนไม่ติดมัน
      -ปรึกษาแพทย์/นักโภชนาการร่วมด้วย
      """,
      adviceworkout: """
      -เริ่มจากคาร์ดิโอเบาๆ (เดิน, ช้าๆ, ว่ายน้ำ, ปั่นจักรยาน) เพื่อให้ร่างกายคุ้นชิน 
      -เพิ่มความหนักเมื่อร่างกายแข็งแรงขึ้น - เวทเทรนนิ่งเพื่อเสริมกล้ามเนื้อ 
      -เน้นความสม่ำเสมอ ไม่หักโหม 
      """,
    ),
  };
}


class BmiData {
  const BmiData({required this.advicefood, required this.adviceworkout});

  final String advicefood;
  final String adviceworkout;
}

String wordDeescriptToBmi(double bmi){
    switch(bmiChecker(bmi)){
      case 1: return "ผอม/น้ำหนักน้อย";
      case 2: return "ปกติ";
      case 3: return "น้ำหนักเกิน";
      default: return "อ้วน/โรคอ้วน";
    }
  }

  int bmiChecker(double bmi) {
    if (bmi < 18.5) {
      return 1;
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return 2;
    } else if (bmi >= 25 && bmi <= 29.9) {
      return 3;
    }else{
      return 4;
    }
  }