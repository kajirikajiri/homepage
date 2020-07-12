<template>
  <div>
    {{$route.query.name}}<br>
    更新:{{$route.query.modify}}<br>
    作成:{{new Date($route.query.birth)}}
    <markdown :markdown="hoge"/>
  </div>
</template>

<script>
import Markdown from '@/components/Markdown.vue'
// import hoge from `@/assets/md/${$route.query.name}`

export default {
  components: {
    Markdown
  },
  data(){
    return {
      hoge: 'hoge'
    }
  },
  created(){
    const a = require(`../assets/md/${this.$route.query.name}`)  // eslint-disable-line
    console.log(a)
    this.hoge = a.default
  }
}
</script>
