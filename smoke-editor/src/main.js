// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import Resource from 'vue-resource'
import App from './App'
import Bulma from 'vue-bulma-components'
import Auth from './auth'
import router from './router'

import { library } from '@fortawesome/fontawesome-svg-core'
import { faWindowMinimize, faWindowMaximize } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

library.add(faWindowMinimize, faWindowMaximize)

Vue.component('font-awesome-icon', FontAwesomeIcon)

Vue.use(Resource)
Vue.use(Bulma)
Vue.config.productionTip = false

Vue.http.headers.common['Authorization'] = `Bearer ${localStorage.getItem('id_token')}`

// Check the user's auth status when the app starts
Auth.checkAuth()

/* eslint-disable no-new */
const app = new Vue({
  el: '#app',
  router,
  template: '<App/>',
  components: { App }
})

export default app
