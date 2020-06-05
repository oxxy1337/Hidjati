import 'package:school/objects/ColorChoice.dart';
import 'package:school/objects/TodoObject.dart';


List<TodoObject> todos = [
  TodoObject.import("SOME_RANDOM_UUID", "قبل الثامن من ذي الحجة", 1, ColorChoices.choices[0],  {
    DateTime(2018, 5, 3): [
      TaskObject("الإحرام من الميقات بنية الحج فقط و التلبية بعد ذلك." ),
      TaskObject("طواف القدوم"),
      TaskObject("ركعتا الطواف"),
      TaskObject("الملتزم - زمزم"),
      TaskObject("سعي العمرة"),
      TaskObject("الحلق أو التقصير وبه التحلل من الإحرام"),
      TaskObject("يبقى محرماً في مكة حتى الثامن من ذي الحجة"),


    ]
  }),
  TodoObject.import("الثامن من ذي الحجة", "الثامن من ذي الحجة", 2, ColorChoices.choices[1],  {
    DateTime(2018, 5, 3): [
      TaskObject("يحرم للحج من المسجد الحرام"),
      TaskObject("ينطلق إلى منى بعد صلاة الفجر"),
      TaskObject("يصلي بها الظهر – العصر – المغرب – العشاء وفجر اليوم التاسع"),
    ],



  }),
  TodoObject.import("التاسع من ذي الحجة", "التاسع من ذي الحجة", 3, ColorChoices.choices[2],  {
    DateTime(2018, 5, 3): [
      TaskObject("الانطلاق إلى عرفات بعد صلاة الفجر"),
      TaskObject("الوصول إلى عرفات"),
      TaskObject("صلاة الظهر و العصر جمع تقديم بوقت الظهر"),
      TaskObject("الإكثار من الذكر و الدعاء حتى غروب الشمس"),
      TaskObject("الإفاضة من عرفات إلى مزدلفة بعد الغروب"),
      TaskObject("صلاة المغرب و العشاء بمزدلفة جمع تأخير بوقت العشاء"),
    ],


  }),

  TodoObject.import("العاشر من ذي الحجة", "العاشر من ذي الحجة", 4, ColorChoices.choices[0],  {
    DateTime(2018, 5, 3): [
      TaskObject("السير إلى منى بعد صلاة الصبح و قبل طلوع الشمس"),
      TaskObject("رمي جمرة العقبة"),
      TaskObject("الذبح (ذبح الهدي) "),
      TaskObject("الحلق أو التقصير"),
      TaskObject("طواف الإفاضة"),
      TaskObject("السعي "),
      TaskObject("العودة إلى مِنى للمبيت"),
    ],


  }),
  TodoObject.import("من 11 - 13 ذي الحجة", "من 11 - 13 ذي الحجة", 5, ColorChoices.choices[1],  {
    DateTime(2018, 5, 3): [
      TaskObject("رمي الجمرات الثلاث ( الصغرى – الوسطى – الكبرى )"),
      TaskObject("العودة إلى مكة لطواف الوداع - نهاية الحج"),
    ],
  }),

];
