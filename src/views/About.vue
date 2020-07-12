<template>
  <div>
    {{$route.query.name}}<br>
    更新:{{new Date($route.query.modify)}}<br>
    作成:{{new Date($route.query.birth)}}<br>
    <vue-markdown class="target" :source="markdown"/>
  </div>
</template>

<script>
import '../plugins/google-code-prettify/run_prettify'

export default {
  data(){
    return {
      markdown: ''
    }
  },
  created(){
    const a = require(`../assets/md/${this.$route.query.name}`)  // eslint-disable-line
    this.markdown = a.default
  },
  mounted() {
    const elements = document.querySelectorAll('.target pre')
    if(!elements) return

    elements.forEach(element=>{
      if(!element) return

      element.className = 'prettyprint'
    })

    this.$nextTick(function () {
      PR.prettyPrint() //eslint-disable-line
    })
  }
}
</script>

<style scoped lang="scss">
  @import '../plugins/google-code-prettify/prettify.css';
  @import '../plugins/google-code-prettify/skins/doxy.css';
</style>
