
const App = getApp();
const navigationBarHeight = (getApp().diygwstatusBarHeight + 44) + 'px'
Page({
data: {
          grids1:[],
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
     this.getGrids1(1);
},
navigateTo(e) {
 App.navigateTo(e.currentTarget.dataset.url, e.currentTarget.dataset);
},
getGrids1(isShow){
	  if(isShow){this.data.gridsPage1=1;}	
	  //调用数据
	  let param = {
          loadmsg:`正在加载中`,
          sort:" by3 desc,",
          f:-1
      };



    App.HttpService.getData(param,"/movies_List.action").then(data=>{
          this.setData({
              grids1: data.data
          });
      });
}

})
