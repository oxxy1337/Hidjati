import 'package:school/objects/ColorChoice.dart';
import 'package:school/objects/TodoObject.dart';
import 'package:flutter/material.dart';

List<TodoObject> todos = [
  TodoObject.import("SOME_RANDOM_UUID", "توجيهات قبل الذهاب", 1, ColorChoices.choices[0],  {
    DateTime(2018, 5, 3): [
      TaskObject("الملابس" ),
      TaskObject("ملابس الإحرام"),
      TaskObject("ادوات النظافة الشخصية"),
      TaskObject("الاوراق المهمة و المتعلقات الثمينة"),
      TaskObject("الادوية "),

    ]
  }),
  TodoObject.import("الاحرام", "الاحرام", 2, ColorChoices.choices[1],  {
    DateTime(2018, 5, 3): [
      TaskObject("عند الميقات – أو قبله - تنظف و اغتسل كما تغتسل من الجنابة و تطيب إن تيسر لك ذلك، ثم البس ملابس الإحرام، و هو إزار و رداء."),
      TaskObject("فإن كان وقت فريضة صليت، وإلا فتصلي ركعتين تنوي بهما سنة الوضوء، إلا الحائض والنفساء فلا تصليا."),
      TaskObject("فإذا فرغت من الصلاة فانو الحج بقلبك- عند الميقات- ، وتلفظ بالنسك الذي تريده بقول : لبيك اللهم حجا،فإن كنت خائفاً من عائق يعوقك عن إتمام النسك فينبغي لك أن تشترط عند الإحرام قائلاً: إن حبسني حابس فمحلي حيث حبستني، وإن كنت لا تخاف شيئًا فلا تشترط."),
      TaskObject("بعدها يحرم عليك لبس المخيط و إزالة الشعر ، و تقليم الأظافر ، و تغطية الرأس والوجه بملاصق ؛ كالطاقية والغترة والعمامة أو نحو ذلك ."),
      TaskObject("كما يحرم استعمال الطيب , و الصيد , و عقد النكاح و الجماع"),
      TaskObject("ويحرم على المسلم – محرما كان أم غير محرم ذكرا كان أم أنثى- قتل صيد الحرم والمعاونة في قتله ، ويحرم تنفيره من مكانه ، ويحرم قطع شجر الحرم ونباته الأخضر."),

      TaskObject("ارفع صوتك بالتلبية قائلا<لبيك اللهم لبيك , لبيك لا شريك لك لبيك , إن الحمد و النعمة لك و الملك , لا شريك لك>و المرأة تقول بقدر ما يسمع نفسها ومن بجنبها من النساء أو محارمها."),
      TaskObject(""),
    ],


  }),
  TodoObject.import("الطواف", "الطواف", 3, ColorChoices.choices[2],  {
    DateTime(2018, 5, 3): [
      TaskObject("Meet Clients"),
      TaskObject("Design Sprint"),
      TaskObject("Icon Set Design for Mobile"),
      TaskObject("HTML/CSS Study"),
    ],


  }),

  TodoObject.import("مقام ابراهيم", "مقام ابراهيم", 4, ColorChoices.choices[0],  {
    DateTime(2018, 5, 3): [
      TaskObject("Meet Clients"),
      TaskObject("Design Sprint"),
      TaskObject("Icon Set Design for Mobile"),
      TaskObject("HTML/CSS Study"),
    ],


  }),
  TodoObject.import("زمزم", "زمزم", 5, ColorChoices.choices[1],  {
    DateTime(2018, 5, 3): [
      TaskObject("Meet Clients"),
      TaskObject("Design Sprint"),
      TaskObject("Icon Set Design for Mobile"),
      TaskObject("HTML/CSS Study"),
    ],


  }),
  TodoObject.import("السعي", "السعي", 5, ColorChoices.choices[2],  {
    DateTime(2018, 5, 3): [
      TaskObject("Meet Clients"),
      TaskObject("Design Sprint"),
      TaskObject("Icon Set Design for Mobile"),
      TaskObject("HTML/CSS Study"),
    ],


  }),



];
