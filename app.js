import polyfill from 'assets/plugins/polyfill'
import WxValidate from 'helpers/WxValidate'
import HttpService from 'helpers/HttpService'
import WxService from 'helpers/WxService'
import Tools from 'helpers/Tools'
import Session from 'helpers/Session'
import Config from 'config/config'
import WxParse from 'wxParse/wxParse'
import config from "config/config";

App({
	onLaunch: function() {
		if (wx.cloud) {
			wx.cloud.init({
				traceUser: true
			})
		}
		wx.getSystemInfo({
			success: e => {
				this.globalData.StatusBar = e.statusBarHeight;
				let capsule = wx.getMenuButtonBoundingClientRect();
				if (capsule) {
					this.globalData.Custom = capsule;
					this.globalData.CustomBar = capsule.bottom + capsule.top - e.statusBarHeight;
				} else {
					this.globalData.CustomBar = e.statusBarHeight + 50;
				}
			}
		})
	},
    onShow() {
    },
    onHide() {
    },


    globalData: {
        userInfo: null,
        tabBar:["/pages/top/index","/pages/news/index","/pages/board/index","/pages/my/index"],
        pages:["/pages/index/index","/pages/news/index","/pages/newsView/index","/pages/board/index","/pages/top/index","/pages/movieView/index","/pages/seat/index","/pages/my/index","/pages/info/index","/pages/orders/index","/pages/ordersView/index","/pages/collect/index"],
		url:config.basePath
    },
    navigateTo(url,param){
    	if (url.startsWith("tel:")){
	        this.makePhoneCall(url);
	    } else if (url.trim().startsWith("map:")){
	        var urls = url.split(":");
	        const longitude = Number(urls[1]);
	        const latitude = Number(urls[2]);	       
	        wx.openLocation({
	          latitude,
	          longitude,
	          scale: 18
	        })
	    }else if (url.trim().startsWith("miniprogram:")){
	       var urls = url.split(":");
	       if(urls.length<2){
	         thiz.WxService.showModal({
		    	title: '友情提示',
		    	content:"请填写如:miniprogram:wx99fd0361f0c87b26",
		    	showCancel: !1,
		     });
	       }
	       var thiz=this;
	       var data = {
			  appId: urls[1],
			  fail(res){
		           if (res.errMsg.indexOf('fail appId')>=0){
		              res.errMsg = "请前往小程序设置小程序白名单：" + urls[1];
		           }
				   thiz.WxService.showModal({
				    	title: '友情提示',
             			content: res.errMsg,
				    	showCancel: !1,
				   });
			  },
			  success(res) {
			      // 打开成功
			  }
		   };
		   if(urls.length>=3){
		   		data.path = urls[2];	
		   } 
	       wx.navigateToMiniProgram(data)
	    }else{
	    	if (url.startsWith("http://")||url.startsWith("https://")){
	    		  this.WxService.navigateTo("/pages/webview/index", param);
	    	}else{
		    	if (!url.startsWith("/pages/")){
		    		   url="/pages/"+url+"/index";
		    	}
		        if (this.globalData.tabBar.indexOf(url) != -1) {
		            this.WxService.switchTab({
		                url: url
		            });
		        } else if(param && param['redirect']){             
	                this.WxService.redirectTo(url, param);
	            } else{
		          	this.WxService.navigateTo(url, param);
		        }
	    	}
	      	
	     }
    },
    renderUrl(url, defaultUrl) {
      if (!url || url=="") {
        url = defaultUrl;
      }
      if (url.trim().startsWith("miniprogram:")) {
         return url;
      }
      if (url.trim().startsWith("map:")) {
        return url;
      }
      if (url.indexOf("__weui-popup")>0||url.startsWith("tel:")||url.startsWith("http://")||url.startsWith("https://")) {
        return url;
      }
      if (url.indexOf("/pages/" + url) != 0) {
        url = "/pages/" + url + "/index";
      }
      return url;
    },
    renderImage(path) {
        if (!path) return ''
        if (path.indexOf('http') !== -1) return path
        return `${this.Config.fileBasePath}${path}`
    },

    renderBoolean(value){
    	if(value=="0"){
    		return false;
    	}
    	return value;
    },
    makePhoneCall: function(number) {
        if (number.currentTarget) {
            var dataset = number.currentTarget.dataset;
            number = dataset.number;
        }
        if(number.indexOf("tel:")!== -1){
        	number=number.substr(4);
        }
        wx.makePhoneCall({
            phoneNumber: number
        })
    },
    WxValidate: (rules, messages) => new WxValidate(rules, messages),
    HttpService: new HttpService,
    getActionUrl(url){
    	return this.HttpService.setUrl(url);
    },
    WxService: new WxService,
    Tools: new Tools,
    Session: Session,
    Config: Config,
    WxParse:WxParse
})
