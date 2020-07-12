<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
import Darkmode from 'darkmode-js';
import Vue from 'vue';
const options = {
  bottom: '64px', // default: '32px'
  right: 'unset', // default: '32px'
  left: '32px', // default: 'unset'
  time: '0.5s', // default: '0.3s'
  mixColor: '#fff', // default: '#fff'
  backgroundColor: '#fff',  // default: '#fff'
  buttonColorDark: '#100f2c',  // default: '#100f2c'
  buttonColorLight: '#fff', // default: '#fff'
  saveInCookies: false, // default: true,
  label: '🌓', // default: ''
  autoMatchOsTheme: true // default: true
}
new Darkmode().showWidget(options)
export default Vue.extend({
  head: {
    link: [
      {
        href: "https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@100;300;400;500;700;900&display=swap",
        rel: "stylesheet"
      }
    ]
  }
})
</script>

<style>
body{ font-family: 'Noto Sans JP', sans-serif;}
</style>
