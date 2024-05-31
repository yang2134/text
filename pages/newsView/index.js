
const App = getApp();
const navigationBarHeight = (getApp().diygwstatusBarHeight + 44) + 'px'
Page({
data: {
          rowdata1:[],
linkid1:'',
linktitle1:'',
linkprice1:'',
  id:'',
  url:App.globalData.url
},

showModal(message) {
   App.WxService.showModal({
    	title: '友情提示',
    	content: message,
    	showCancel: !1,
   });
},
onShareAppMessage: function () {
},
onLoad(option) {
	if (option){
      this.setData({
         globalOption: option,
        id:option.id
      })
    }

	console.log(option);
},
onShow(){
     this.getRowdata1();
},
navigateTo(e) {
 App.navigateTo(e.currentTarget.dataset.url, e.currentTarget.dataset);
},
getRowdata1(){
      var that = this;
	  //调用数据
	  let param = {
          nid:that.data.id,
          f:0,
      };
      param =App.Tools.extend(param,this.data.globalOption);
      //调用数据
      App.HttpService.getData(param,"/news_List.action").then(data=>{
        this.setData({
          rowdata1: data.data
        });
      });
}


})
