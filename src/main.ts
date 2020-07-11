import Vue from 'vue'
import App from './App.vue'
import './registerServiceWorker'
import router from './router'
import store from './store'
// import 'destyle.css'
import VueMarkdown from 'vue-markdown'
import './assets/scss/common.scss'

Vue.config.productionTip = false

Vue.component('vue-markdown', VueMarkdown)

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
