var arrLang = new Array();
    arrLang['en'] = new Array();
    arrLang['ar'] = new Array();


    // English content
    arrLang['en']['guide'] = 'Hidjati...Your guide for Hajj and Umrah';
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
    arrLang['en']['about'] = 'About us ';








    //Arabic content
    arrLang['ar']['guide'] = 'حجتي ...دليلك للحج و العمرة';
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
    arrLang['ar']['about'] = ' عن فريقنا';












   
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
        document.getElementById("ar").style.right = "140px";
        document.getElementById("store").style.left = "320px";
        document.getElementById("store").style.top = "240px";
        document.getElementById("tstore").style.left = "45px";
        document.getElementById("tstore").style.top = "280px";
        document.getElementById("more").style.left = "10px";
        document.getElementById("reg").style.left = "400px";
        document.getElementById("reg").style.top = "125px";
        document.getElementById("dow").style.left = "50px";
        document.getElementById("li1").style.bottom = "150px";








     });

     $('#ar').click(function(){
      document.getElementById("ar").style.right = "180px";
      document.getElementById("more").style.left = "240px";
      document.getElementById("reg").style.left = "280px";
      document.getElementById("store").style.left = "20px";
      document.getElementById("store").style.top = "280px";
      document.getElementById("tstore").style.left = "200px";
      document.getElementById("tstore").style.top = "320px";
      document.getElementById("li1").style.bottom = "105px";
      document.getElementById("dow").style.left = "150px";


    });
    