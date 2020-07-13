var arrLang = new Array();
    arrLang['en'] = new Array();
    arrLang['ar'] = new Array();


    // English content
    arrLang['en']['hidjati'] = 'Hidjati';
    arrLang['en']['guide'] = 'Your guide for Hajj and Umrah';
    arrLang['en']['more'] = 'For more..';
    arrLang['en']['register'] = 'Register';
    arrLang['en']['playstore'] = 'Download Hidjati App for free on';
    arrLang['en']['playstore2'] = 'Download Hidjati App for free on';
    arrLang['en']['login'] = 'Login';
    arrLang['en']['login2'] = 'For more';
    arrLang['en']['reg1'] = 'Register';
    arrLang['en']['sign'] = 'Register';
    arrLang['en']['direction'] = 'What is your destination';
    arrLang['en']['haj'] = 'Hajj';
    arrLang['en']['omra'] = 'Umrah';
    arrLang['en']['discover'] = 'Discover Hidjati mobile app';
    arrLang['en']['follow'] = 'Follow us on';






    //Arabic content
    arrLang['ar']['hidjati'] = 'حجتي';
    arrLang['ar']['guide'] = 'دليلك للحج و العمرة';
    arrLang['ar']['more'] = '..للمزيد'
    arrLang['ar']['login2'] = '..للمزيد'
    arrLang['ar']['register'] = 'اشتراك';
    arrLang['ar']['playstore'] = 'حمل تطبيق حجتي مجانا على';
    arrLang['ar']['playstore2'] = 'حمل تطبيق حجتي مجانا على'; 
    arrLang['ar']['login'] = 'تسجيل الدخول ';
    arrLang['ar']['sign'] = 'اشتراك';
    arrLang['ar']['reg1'] = 'اشتراك';
    arrLang['ar']['direction'] = 'ما هي وجهتك';
    arrLang['ar']['haj'] = 'حج';
    arrLang['ar']['omra'] = 'عمرة';
    arrLang['ar']['discover'] = 'اكتشف تطبيق حجتي';
    arrLang['ar']['follow'] = '  تابع حجتي على';











   
    // Process  translation
    $(function() {
      $('.translate').click(function() {
        var lang = $(this).attr('id');

        $('.lang').each(function(index, item) {
          $(this).text(arrLang[lang][$(this).attr('key')]);
        });
      });
    });

    $('#en').click(function(){
        document.getElementById("ar").style.left = "40px";
        document.getElementById("store").style.left = "400px";
        document.getElementById("tstore").style.left = "100px";
        document.getElementById("more").style.left = "120px";
        document.getElementById("reg").style.left = "450px";
        document.getElementById("reg").style.top = "25px";



     });

     $('#ar').click(function(){
      
      document.getElementById("more").style.left = "240px";
      document.getElementById("reg").style.left = "210px";
      document.getElementById("store").style.left = "230px";
      document.getElementById("tstore").style.left = "400px";
    });
    