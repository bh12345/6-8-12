
//= require jquery3
function show_result(data)
{
  var result = document.getElementById("result");
  var str = "<hr/>Исходно введенные значения: " + data.val +"<hr/>"
  +"<hr/>Всего отрезков: " + data.size +"<hr/>"
  +"<hr/>Максимальная длина отрезка: " + data.max +"<hr/>"
  +"<table><tr><th>Номер</th><th>Длина</th><th>Содержание</th></tr>";

  for (i = 0; i < data.size; i++)
  {
    str+="<tr><td>"+(i+1)+"</td>"
    str+="<td>"+data.len[i]+"</td>"
    str+="<td>"+data.arr[i]+"</td></tr>"
  }
  str+="</table>"
  result.innerHTML = str;
}
$(document).ready(function(){$("#input_form").bind('ajax:success', function(event) {var data = event.detail[0]; show_result(data)})})
