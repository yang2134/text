
const App = getApp();
const navigationBarHeight = (getApp().diygwstatusBarHeight + 44) + 'px'
Page({
data: {
          msgs1:[],
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
delData1(e){
    var that = this;
   const dataset = e.currentTarget.dataset;
   let param = {
   	  cid:dataset.id,
   };
   App.WxService.showModal({
	    title: '友情提示', 
	    content: '确定要删除吗？', 
   }).then(data => {
	    if (data.confirm == 1) {
	      App.HttpService.delData(param,"/collects_Del.action").then(data => {
              wx.showToast({
                  title: '删除成功',
                  icon: 'none',
                  duration: 2000
              })

              setTimeout(function(){
                    that.getMsgs1(1);
              },2000);
	      });
	    }
	})
},
getMsgs1(isShow){
	  if(isShow){this.data.msgsPage1=1;}	
	  //调用数据
      let param = {
      	  meid:wx.getStorageSync("mid"),
          loadmsg:`正在加载中`
      };
      
      

      App.HttpService.getData(param,"/collects_List.action").then(data=>{
          this.setData({
              msgs1: data.data
          });
      });
}

})
