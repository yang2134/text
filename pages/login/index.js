const App = getApp();

Page({
	data: {
		logged: !1,
    	logo:'/assets/images/favicon.png',
    	title: App.Config.title,
		userInfo: {},
		hasUserInfo: false,
		canIUse: wx.canIUse('button.open-type.getUserInfo')
	},
	onLoad: function () {
		if (App.globalData.userInfo) {
			this.setData({
				userInfo: App.globalData.userInfo,
				hasUserInfo: true
			})
		} else if (this.data.canIUse){
			// 所以此处加入 callback 以防止这种情况
			App.userInfoReadyCallback = res => {
				this.setData({
					userInfo: res.userInfo,
					hasUserInfo: true
				})
			}
		} else {
			// 在没有 open-type=getUserInfo 版本的兼容处理
			wx.getUserInfo({
				success: res => {


					App.globalData.userInfo = res.userInfo
					this.setData({
						userInfo: res.userInfo,
						hasUserInfo: true
					})


					wx.switchTab({
						url:"/pages/index/index"
					})
				}
			})
		}
	},
    onShow() {

    },
    login() {


		wx.getUserProfile({
			desc:'获取用户相关信息',
			success: res => {
				App.globalData.userInfo = res.userInfo
				console.log(App.globalData.userInfo);

				//调用数据
				let param = {
					mname:App.globalData.userInfo.nickName,
					photo:App.globalData.userInfo.avatarUrl
				};
				param =App.Tools.extend(param,this.data.globalOption);
				//调用数据
				App.HttpService.getData(param,"/members_Add.action").then(data=>{
					console.log(data);
					wx.setStorageSync("mid",data);
					wx.setStorageSync("pic",App.globalData.userInfo.avatarUrl)
					wx.setStorageSync("nc",App.globalData.userInfo.nickName)

				});

				wx.switchTab({
					url:"/pages/index/index"
				})
			}
		})
    },
    goIndex() {
    	if (App.Session.getRedirecturl()){
          var redirecturl = App.Session.getRedirecturl();
          App.Session.setRedirecturl(null);
          App.navigateTo(redirecturl);
          return;
      	}
    	if(App.globalData.tabBar.length>0){
        	App.navigateTo(App.globalData.tabBar[0]);
        }else if(App.globalData.pages.length>0){
        	App.navigateTo(App.globalData.pages[0]);
        }else{
            App.WxService.showModal({
		    	title: '友情提示',
		    	content: '',
		    	showCancel: !1,
		   });
        }
    },
	showModal() {
		App.WxService.showModal({
            title: '友情提示', 
            content: '获取用户登录状态失败，请重新登录', 
            showCancel: !1, 
        })
	}

})