import ServiceBase from 'ServiceBase'

class Service extends ServiceBase {
  constructor() {
    super()
    this.$$prefix = ''
    this.$$path = {

    }
  }

  wechatSignUp(params) {
    return this.postRequest(this.$$path.wechatSignUp, params)
  }

  wechatSignIn(params) {
    return this.postRequest(this.$$path.wechatSignIn, params)
  }

  wechatDecryptData(params) {
    return this.postRequest(this.$$path.decryptData, params)
  }


  signIn(params) {
    return this.postRequest(this.$$path.signIn, params)
  }

  signOut() {
    return this.postRequest(this.$$path.signOut)
  }

  //获取表格分页数据
  getData(params, url) {
    return this.postRequest(url || this.$$path.data, params)
  }

  //保存数据
  saveData(params, url) {
    return this.postRequest(url || this.$$path.save, params)
  }

  //删除数据
  delData(params, url) {
    return this.postRequest(url || this.$$path.del, params)
  }

}

export default Service