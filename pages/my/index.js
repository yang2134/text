
const App = getApp();
const navigationBarHeight = (getApp().diygwstatusBarHeight + 44) + 'px'
Page({
  data: {
    pic:'',
    nc:''
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
        pic:wx.getStorageSync("pic"),
        nc:wx.getStorageSync("nc")
      })
    }

    console.log(this.data.pic)
  },
  onShow(){


  },
  navigateTo(e) {
    App.navigateTo(e.currentTarget.dataset.url, e.currentTarget.dataset);
  },


})
