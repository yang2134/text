
const App = getApp();
const navigationBarHeight = (getApp().diygwstatusBarHeight + 44) + 'px'
Page({
data: {
          msgs1:[],
    id:0,
    url:App.globalData.url,
msgsHasNext1:true
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
},
onShow(){
     this.getMsgs1(1);
},

getMsgs1(isShow){
	  if(isShow){this.data.msgsPage1=1;}	
	  //调用数据
      let param = {
      	  oid:this.data.id,
          loadmsg:`正在加载中`
      };

	  console.log(param);
      

      App.HttpService.getData(param,"/orders_List.action").then(data=>{
          this.setData({
              msgs1: data.data
          });
      });
}

})
