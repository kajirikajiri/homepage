<template>
<div>
  <vue-markdown class="target" :source="markdown"/>
</div>
</template>

<script lang="ts">
import Vue from 'vue';
import PR from '../plugins/google-code-prettify/run_prettify'

export default Vue.extend({
  props: {
    markdown: String,
  },
  mounted() {
    const elements: NodeListOf<Element>|null = document.querySelectorAll('.target pre')
    if(!elements) return

    elements.forEach(element=>{
      if(!element) return

      element.className = 'prettyprint'
    })

    this.$nextTick(function () {
      PR.prettyPrint()
    })
  }
});
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
  @import '../plugins/google-code-prettify/prettify.css';
  @import '../plugins/google-code-prettify/skins/doxy.css';
</style>
