<template>
  <vue-markdown :source="hoge"/>
</template>

<script lang="ts">
import Vue from 'vue';
import hoge from '@/assets/md/hoge.md'

export default Vue.extend({
  name: 'HelloWorld',
  props: {
    msg: String,
  },
  data(){
    return {
      hoge
    }
  },
});
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
</style>
