

function getDates(days,todate=getCurrentMonthFirst()) {//todate默认参数是当前日期，可以传入对应时间
  var dateArry = [];
  for (var i = 0; i < days; i++) {
    var dateObj = getAdd( i);
    dateArry.push(dateObj)
  }
  return dateArry;
}

//获取当前时间
function getCurrentMonthFirst() {
  var date = new Date();
  var todate = date.getFullYear() + "-" + ((date.getMonth() + 1) < 10 ? ("0" + (date.getMonth() + 1))
      : date.getMonth()+1) + "-" + (date.getDate() < 10 ? ("0" + date.getDate()) : date.getDate());
  return todate;
}

function getAdd(d) {
  var date = new Date();
    date.setDate(date.getDate() + d);//获取AddDayCount天后的日期
    var y = date.getFullYear();
    var m = date.getMonth() + 1;//获取当前月份的日期
    var d = date.getDate();

    //格式为yyyy-MM-dd
    return y + "-" + (m < 10 ? "0" + m : m) + "-" + (d < 10 ? "0" + d : d);

}

module.exports = {
  getDates: getDates
}