
const App = getApp();
const navigationBarHeight = (getApp().diygwstatusBarHeight + 44) + 'px'
Page({
data: {
          swipers1: [],
     tabsActiveIndex2:0,
tabs2:[],
     msgs3:[],
    keys:'',
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
     this.getSwipers1();
     this.getTabs2();

},

    navigateTo(e) {
     App.navigateTo(e.currentTarget.dataset.url, e.currentTarget.dataset);
    },


getSwipers1(){
	  //调用数据
	  var datas=[
	  	 {thumb_url:'/assets/images/pic1.jpg',title:`滑块资讯一`,url:App.renderUrl('','index')},
	  	 {thumb_url:'/assets/images/pic2.jpg',title:`滑块资讯二`,url:App.renderUrl('','index')},
	  	 {thumb_url:'/assets/images/pic3.jpg',title:`滑块资讯三`,url:App.renderUrl('','index')}
	  ];
      this.setData({
          swipers1: datas
      });
},
getTabs2(page){
	  //调用数据
      App.HttpService.getData({
          formid:'mtype',
          row:20,
          f:1,
      },"/mtype_List.action").then(data=>{

          this.setData({
              tabs2: data.data
          });

          this.getMsgs3(1);
     });
},
tabClick2: function (e) {
	const dataset = e.currentTarget.dataset;
	var zjson= App.Tools.fromJson(dataset.zdys);

    this.setData({
    	tabsActiveIndex2: dataset.id
    });

    this.getMsgs3(1);
},
getMsgs3(isShow){
	  if(isShow){this.data.msgsPage3=1;}	
	  //调用数据
      let param = {
          row:10,
          loadmsg:`正在加载中`,
          tid:this.data.tabsActiveIndex2,
          condition: " and (title like '%"+this.data.keys+"%' or daoy like '%"+this.data.keys+"%' or zhuy like '%"+this.data.keys+"%') "
      };
      


      App.HttpService.getData(param,"/movies_List.action").then(data=>{
          this.setData({
              msgs3: data.data
          });
      });
},

    getInputValue(e) {
        this.setData({
            keys: e.detail.value
        })
    },

    search(e)
    {
        this.getMsgs3();
    }

})
