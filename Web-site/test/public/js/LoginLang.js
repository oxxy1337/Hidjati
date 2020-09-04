var arrLang = new Array();
    arrLang['en'] = new Array();
    arrLang['ar'] = new Array();


    // English content
    arrLang['en']['hidjati'] = 'Hidjati';
    arrLang['en']['guide'] = 'Your guide for Hajj and Umrah';
    arrLang['en']['register'] = 'Register';
    arrLang['en']['playstore'] = 'Download Hidjati App for free on';
    arrLang['en']['login'] = 'Login';
    arrLang['en']['follow'] = 'Follow us on';
    arrLang['en']['fill'] = 'Fill your informations to login';
    arrLang['en']['fill2'] = 'Fill your informations to register';
    arrLang['en']['noacc'] = 'Or';
    arrLang['en']['email'] = 'E-mail address';
    arrLang['en']['mdp'] = 'Password';
    arrLang['en']['fname'] = 'First name';
    arrLang['en']['lname'] = 'Last name';
    arrLang['en']['male'] = 'Male';
    arrLang['en']['female'] = 'Female';
    arrLang['en']['country'] = 'Country';
    arrLang['en']['alg'] = 'Algeria';
    arrLang['en']['mrc'] = 'Morroco';
    arrLang['en']['tun'] = 'Tunisia';
    arrLang['en']['choose'] = 'Choose';
    arrLang['en']['username'] = 'Username';











    //Arabic content
    arrLang['ar']['hidjati'] = 'حجتي';
    arrLang['ar']['guide'] = 'دليلك للحج و العمرة';
    arrLang['ar']['more'] = '..للمزيد'
    arrLang['ar']['login2'] = '..للمزيد'
    arrLang['ar']['register'] = 'اشتراك';
    arrLang['ar']['playstore'] = 'حمل تطبيق حجتي مجانا على';
    arrLang['ar']['login'] = ' الدخول ';
    arrLang['ar']['sign'] = 'اشتراك';
    arrLang['ar']['reg1'] = 'اشتراك';
    arrLang['ar']['follow'] = '  تابع حجتي على';
    arrLang['ar']['fill'] = 'املا خانات المعلومات للدخول ';
    arrLang['ar']['fill2'] = 'املا خانات المعلومات للاشتراك ';
    arrLang['ar']['noacc'] = ' ليس لديك حساب';
    arrLang['ar']['email'] = 'البريد الالكتروني';
    arrLang['ar']['fname'] = ' الاسم';
    arrLang['ar']['lname'] = ' اللقب';
    arrLang['ar']['choose'] = 'اختر ';
    arrLang['ar']['country'] = ' البلد';
    arrLang['ar']['alg'] = ' الجزائر';
    arrLang['ar']['tun'] = ' تونس';
    arrLang['ar']['mrc'] = 'المغرب';
    arrLang['ar']['male'] = 'ذكر';
    arrLang['ar']['female'] = 'انثى';
















   
    // Process  translation
    $(function() {
      $('.translate').click(function() {
        var lang = $(this).attr('id');

        $('.lang').each(function(index, item) {
          $(this).text(arrLang[lang][$(this).attr('key')]);
        });
      });
    });

    