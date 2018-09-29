import Vue from 'vue'
import Router from 'vue-router'
import WatchList from '@/components/WatchList'
import Remind from '@/components/Remind'
import Settings from '@/components/Settings'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      redirect: '/web/watchlist'
    },
    {
      path: '/web/watchlist',
      name: 'WatchList',
      component: WatchList
    },
    {
      path: '/web/remind',
      name: 'Remind',
      component: Remind
    },
    {
      path: '/web/settings',
      name: 'Settings',
      component: Settings
    }
  ]
})
