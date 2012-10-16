$(function () {
  $('table.proc-info').stupidtable();

  $('th.type-int').click(function(){
    $("th.type-int i").removeClass('icon-chevron-down icon-chevron-up');

    var element = $(this);
    if(element.hasClass('asc') == true)
     {
       element.find('i').addClass('icon-chevron-up');
     }
     else
     {
       element.find('i').addClass('icon-chevron-down');
     }
  });
});
