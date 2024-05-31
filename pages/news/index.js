
const App = getApp();
const navigationBarHeight = (getApp().diygwstatusBarHeight + 44) + 'px'
Page({
data: {
          msgs1:[],
msgsPage1:1,
msgsTotalPage1:1,
msgsPageDirection1:'down',
msgsHasNext1:true,
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
         globalOption: option
      })
    }
},
onShow(){
     this.getMsgs1(1);
},
navigateTo(e) {
 App.navigateTo(e.currentTarget.dataset.url, e.currentTarget.dataset);
},
getMsgs1(isShow){
	  if(isShow){this.data.msgsPage1=1;}	
	  //调用数据
      let param = {

      };
      

      

      App.HttpService.getData(param,"/news_List.ation").then(data=>{

          this.setData({
              msgs1: data.data
          });
      });
}

})
