const App = getApp();
const navigationBarHeight = (getApp().diygwstatusBarHeight + 44) + 'px'
Page({
    data: {
        buttons2: [
            {type: 'submit', url: App.renderUrl('empty', 'index'), title: ``}
        ],
        user: []
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

        this.getMsgs1(1);
    },
    onShow() {
        this.getForm1();

    },
    navigateTo(e) {
        App.navigateTo(e.currentTarget.dataset.url, e.currentTarget.dataset);
    },

    getMsgs1(isShow) {
        if (isShow) {
            this.data.msgsPage1 = 1;
        }
        //调用数据
        let param = {
            loadmsg: `正在加载中`,
            meid: wx.getStorageSync("meid")
        };

        if (this.data.globalOption && this.data.globalOption.zdys) {
            param = App.Tools.extend(param, App.Tools.fromJson(this.data.globalOption.zdys));
        }
        App.HttpService.getData(param, "/members_List.action").then(data => {

            this.setData({
                user: data.data
            });
        });
    }
    ,

    getForm1() {
        this.WxValidate = App.WxValidate({
            sname: {
                required: {
                    message: '姓名：不能为空哟'
                }
            },
            tel: {
                required: {
                    message: '手机号码：不能为空哟'
                },
                tel: {
                    message: '手机号码：请输入11位的手机号码'
                }
            },
            address: {
                required: {
                    message: '联系地址：不能为空哟'
                }
            },
            qq: {
                required: {
                    message: 'qq：不能为空哟'
                }
            },
            email: {
                required: {
                    message: '电子邮箱：不能为空哟'
                },
                email: {
                    message: '电子邮箱：请输入正确的电子邮箱'
                }
            },
        })
    },
    formSubmit1: function (e) {
        if (!this.WxValidate.checkForm(e)) {
            const error = this.WxValidate.errorList[0]
            var msg = `${error.msg}`;
            this.showModal(msg);
            return false
        } else {
            var data = e.detail.value;
            if (this.data.globalOption && this.data.globalOption.id) {
                data.meid = this.data.globalOption.id;
            }
            App.HttpService.saveData(data, "/members_Edit.action").then(data => {

                App.WxService.showToast({
                    title: "修改成功!",
                    icon: 'success',
                    duration: 1500,
                });
                setTimeout(function () {
                    wx.navigateBack();
                }, 1000)


            });
        }
    },
    formReset1: function () {
        console.log('form发生了reset事件')
    },

    onChangeAddress: function () {
        var _page = this;
        wx.chooseLocation({
            success: function (res) {
                console.log(res);
                _page.setData({
                    address: res.address
                });
            },
            fail: function (err) {
                console.log(err)
            }
        });
    },

})
