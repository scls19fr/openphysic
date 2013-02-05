function b_can_update_now() {
  var now = new Date();
  var cur_time = now.getHours() + now.getMinutes()/60.0;
  var b_result = !((now.getDay()==1) && (cur_time>11.5) && (cur_time<14.5)); // never update monday noonday (lundi midi)
  return b_result;
}
