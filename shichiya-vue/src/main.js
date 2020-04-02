import Vue from 'vue'
import App from './App'
import router from './router'
// 引入ElementUI
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import store from './store'
// 设置反向代理，前端请求默认发送到 http://localhost:8443/api
var axios = require('axios')
axios.defaults.withCredentials = true
axios.defaults.baseURL = 'http://localhost:8443/api'
// 全局注册，之后可在其他组件中通过 this.$axios 发送数据
Vue.prototype.$axios = axios
Vue.config.productionTip = false

Vue.use(ElementUI)

// 使用钩子函数判断是否拦截,在访问每一个路由前调用
router.beforeEach((to, from, next) => {
  // 首先判断访问的路径是否需要被拦截进行登录
  if (to.meta.requireAuth) {
    // 判断 store 里有没有存储 user 的信息，如果存在，则放行
    if (store.state.user.username) {
      axios.get('/authentication').then(resp => {
        console.log(resp)
        if (resp.data) {
          next()
        }
      })
    } else {
      // 否则跳转到登录页面
      // 并存储访问的页面路径（以便在登录后跳转到访问页）
      next({
        path: 'login',
        query: {redirect: to.fullPath}
      })
    }
  } else {
    next()
  }
})

/* eslint-disable no-new */
new Vue({
  el: '#app',
  render: h => h(App),
  router,
  store,
  components: { App },
  template: '<App/>'
})
