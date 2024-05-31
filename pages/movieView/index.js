var util=require("../../utils/util.js")

const App = getApp();
const navigationBarHeight = (getApp().diygwstatusBarHeight + 44) + 'px'
Page({
data: {
          rowdata1:[],
    rmemo:'',
     tabs2:['剧情简介','评论','购票'],
	activeIndex2:0,
     videos3:[],
     msgs4:[],
     msgs5:[],
    url:App.globalData.url,
    radioItems6:[{"checked":true,"label":"10","value":"10"},{"checked":false,"label":"9","value":"9"},{"checked":false,"label":"8","value":"8"},{"checked":false,"label":"7","value":"7"},{"checked":false,"label":"6","value":"6"},{"checked":false,"label":"5","value":"5"},{"checked":false,"label":"4","value":"4"},{"checked":false,"label":"3","value":"3"},{"checked":false,"label":"2","value":"2"},{"checked":false,"label":"1","value":"1"}],
    buttons7:[
        {type:'submit',url:App.renderUrl('empty','index'),title:``}
    ],
    kong:'',
    selectIds1:['1','2','3'],
    selectItems1:[],
    valueIndex1:0,
    sval:'',
    msg:'',
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
	    console.log(option);
      this.setData({
         globalOption: option,
          selectItems1:util.getDates(3)
      })
    }


},
onShow(){
     this.getRowdata1();

     this.setData({
         sval:this.data.selectItems1[this.data.valueIndex1]
     })
    console.log(this.data.sval);
},
navigateTo(e) {
 App.navigateTo(e.currentTarget.dataset.url, e.currentTarget.dataset);
},
getRowdata1(){
      var that = this;
	  //调用数据
	  let param = {
	      f:2,
          mid:this.data.globalOption.id,
          mid2: wx.getStorageSync("mid"),
      };
      param =App.Tools.extend(param,this.data.globalOption);
      //调用数据
      App.HttpService.getData(param,"/movies_List.action").then(data=>{

          this.setData({
              rowdata1: data.data,
              rmemo:data.data[0].memo,
              msgs4:data.data2,
              msgs5:data.data3,
              msg:data.msg
          });
      });
},

tabClick2: function (e) {
	const dataset = e.currentTarget.dataset;
    this.setData({
        activeIndex2: dataset.id
    });
},


    getForm5(){
        this.WxValidate = App.WxValidate({
            amemo: {
                required:{
                    message:'评语：不能为空哟'
                }
            }
        })
    },
    formSubmit5: function (e) {
        var that=this;
        that.getForm5();

        console.log(e.detail.value.score);
        if (!this.WxValidate.checkForm(e)) {
            const error = this.WxValidate.errorList[0]
            var msg = `${error.msg}`;
            this.showDiygwToast(msg);
            return false
        }else{
            var data = e.detail.value;
            if(this.data.globalOption && this.data.globalOption.id){
                data.mid=this.data.globalOption.id;
                data.meid=wx.getStorageSync("mid");


            }
            App.HttpService.saveData(data,"/assess_Add.action").then(data => {
                App.WxService.showToast({
                    title: "评论成功!",
                    icon: 'success',
                    duration: 1500,
                });
                setTimeout(function () {
                    that.setData({
                        kong:''
                    })
                    that.getRowdata1();
                }, 1500)

            });
        }
    },
    formReset5: function() {
        console.log('form发生了reset事件')
    },
    changescore: function (value) {
        if(value.detail){
            value = value.detail.value
        }
        var radioItems6 = this.data.radioItems6;
        for (var i = 0, len = radioItems6.length; i < len; ++i) {
            radioItems6[i].checked = radioItems6[i].value == value;
        }
        this.setData({
            radioItems6: radioItems6
        });
    },

    selectChange1: function (e) {
        this.setData({
            sval:this.data.selectItems1[ e.detail.value],
            valueIndex1: e.detail.value
        });

        console.log(this.data.sval);
    },

    navigateTo2:function (e){
    console.log(e.currentTarget.dataset.id);

        wx.navigateTo({
            url:"/pages/seat/index?pid="+e.currentTarget.dataset.id+"&rid="+e.currentTarget.dataset.rid+"&mid="+this.data.globalOption.id+"&d="+this.data.sval+"&price="+e.currentTarget.dataset.price
        })
    },

    shoucang:function (e){
        var that=this;
        var data = {
            mid:that.data.globalOption.id,
            meid:wx.getStorageSync("mid")
        };

        App.HttpService.saveData(data,"/collects_Add.action").then(data => {

            wx.showToast({
                title: '收藏成功',
                icon: 'success',
                duration: 2000
            })
            setTimeout(function () {
                that.getRowdata1();
            }, 1500)

        });
    }

})
