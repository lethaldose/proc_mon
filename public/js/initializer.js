$(function () {

  $('th.type-int').click(function(){
    $('th').removeClass('sort');
    $(this).addClass('sort');
  });

  $('table.proc-info').stupidtable();
});
