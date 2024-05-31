const App = getApp();
const navigationBarHeight = (getApp().diygwstatusBarHeight + 44) + 'px'
Page({
    data: {
        times1: [],
        total: 0,
        text: [],
        tval: [],
        smoney: 0
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
        console.log(option);
        if (option) {
            this.setData({
                globalOption: option
            })
        }


    },
    onShow() {
        this.getTimes1(1);
    },
    navigateTo(e) {
        App.navigateTo(e.currentTarget.dataset.url, e.currentTarget.dataset);
    },
    getTimes1(isShow) {
        if (isShow) {
            this.data.timesPage1 = 1;
        }
        //调用数据
        let param = {
            rid: this.data.globalOption.rid,
            pid: this.data.globalOption.pid,
            rdate: this.data.globalOption.d
        };


        App.HttpService.getData(param, "/queryReport.action").then(data => {
            console.log(data.total);
            this.setData({
                times1: data.val,
                total: data.total
            });
        });
    },
    arrayfind(arr, string) {
        var flag = 0;
        for (var i = 0; i < arr.length; i++) {
            if (arr[i] == string) {
                flag = 1;
                break;
            }
        }

        return flag;
    },

    dianji: function (e) {

        var ss = this.data.tval;
        var ss2 = this.data.text;

        if (this.arrayfind(ss, e.currentTarget.dataset.id) > 0) {
            this.delete(ss, ss2, e.currentTarget.dataset.id);
        } else {
            ss.push(e.currentTarget.dataset.id);
            ss2.push(e.currentTarget.dataset.val);

            this.setData({
                tval: ss,
                text: ss2
            })
        }

        this.setData({
            smoney: this.data.tval.length * this.data.globalOption.price
        })

        console.log(this.data.tval.toString());
        console.log(this.data.text.toString());
    },


    delete(ss, tt, val) {
        var ss1 = [];
        var ss2 = [];
        for (var i = 0; i < ss.length; i++) {
            if (ss[i] != val) {
                ss1.push(ss[i]);
                ss2.push(tt[i]);
            }
        }
        this.setData({
            tval: ss1,
            text: ss2
        })
    },

    pay() {

        if (this.data.tval.length == 0) {
            this.showModal("请选择座位");
            return;
        }

        //调用数据
        let param = {
            mid: this.data.globalOption.mid,
            rid: this.data.globalOption.rid,
            rdate: this.data.globalOption.d,
            pid: this.data.globalOption.pid,
            by1: this.data.tval,
            ostext: this.data.text,
            quan: this.data.tval.length,
            meid: wx.getStorageSync("mid"),
            smoney: this.data.smoney
        };
        param = App.Tools.extend(param, this.data.globalOption);
        //调用数据
        App.HttpService.getData(param, "/orders_Add.action").then(data => {
            App.WxService.showToast({
                title: "支付成功!",
                icon: 'success',
                duration: 1000,
            });
            setTimeout(function () {
                wx.navigateBack();
            }, 1000)
        });
    },



})
