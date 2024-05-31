const App = getApp();
const navigationBarHeight = (getApp().diygwstatusBarHeight + 44) + 'px'
Page({
    data: {
        msgs1: [],
        url: App.globalData.url,
        msgsHasNext1: true
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
        if (option) {
            this.setData({
                globalOption: option
            })
        }
    },
    onShow() {
        this.getMsgs1(1);
    },
    navigateTo(e) {
        App.navigateTo(e.currentTarget.dataset.url, e.currentTarget.dataset);
    },
    showData1(e) {
        wx.navigateTo({
            url: "/pages/ordersView/index?id=" + e.currentTarget.dataset.id
        })
    },
    getMsgs1(isShow) {
        if (isShow) {
            this.data.msgsPage1 = 1;
        }
        //调用数据
        let param = {
            f:1,
            meid: wx.getStorageSync("mid"),
            loadmsg: `正在加载中`
        };


        App.HttpService.getData(param, "/orders_List.action").then(data => {
            this.setData({
                msgs1: data.data
            });
        });
    },


        dele(e){
        var
            that = this;
                const dataset = e.currentTarget.dataset;
                let param = {
                    f:1,
                    oid:dataset.id
                };
                App.WxService.showModal({
                    title: '友情提示',
                    content: '您确定要取消订单吗？',
                }).then(data => {
                    if (data.confirm == 1) {
                        App.HttpService.delData(param,"/orders_Del.action").then(data => {
                            App.WxService.showToast({
                                title: "操作成功!",
                                icon: 'success',
                                duration: 1500,
                            });
                            setTimeout(function () {
                                that.getMsgs1();
                            }, 1500)


                        });
                    }
                })
            },

})
