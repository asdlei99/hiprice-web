<template>
  <transition enter-active-class="animated slideInRight">
    <v-layout column>

      <v-list two-line subheader>
        <v-subheader>勿扰模式</v-subheader>

        <v-list-tile>
          <v-list-tile-content>
            <v-list-tile-title>勿扰模式</v-list-tile-title>
            <v-list-tile-sub-title>开启后在23:00-07:00之间不会收到提醒</v-list-tile-sub-title>
            <v-list-tile-sub-title>这期间的消息会在07:00以后再推送</v-list-tile-sub-title>
          </v-list-tile-content>

          <v-list-tile-action>
            <v-switch :input-value="disturb === 0" color="blue" @click="changeSettings()"></v-switch>
          </v-list-tile-action>
        </v-list-tile>
      </v-list>

      <v-layout>
        <v-snackbar v-model="showSnackbar" :timeout="2000" color="error">{{ snackbarText }}</v-snackbar>
      </v-layout>

    </v-layout>
  </transition>
</template>

<script>
  import Bus from '../bus'

  export default {
    data: () => ({
      disturb: 0,
      showSnackbar: false,
      snackbarText: '请求失败，请稍后再试'
    }),

    created () {
      Bus.$emit('tab.conf', true, 1)
      if (global.Store.user === '') {
        console.log('missing user param')
        return
      }
      this.getSettings()
    },

    methods: {
      getSettings () {
        this.$axios.get('settings?u=' + global.Store.user).then(resp => {
          if (resp.data.ret !== 0) {
            console.log(resp.data.status)
            return
          }
          this.disturb = resp.data.data.disturb
        }).catch(() => {
          console.log('request failed: getSettings')
          this.showSnackbar = true
        })
      },

      changeSettings () {
        let v = this.disturb === 0 ? 0 : 1
        let data = JSON.stringify({disturb: v})
        this.$axios.post('settings?u=' + global.Store.user, data).then(resp => {
          if (resp.data.ret !== 0) {
            console.log(resp.data.status)
            return
          }
          this.disturb = v
        }).catch(() => {
          console.log('request failed: changeSettings')
          this.showSnackbar = true
        })
      }
    }
  }
</script>

<style>
  .animated {
    animation-duration: .2s;
    animation-fill-mode: both;
  }
</style>
