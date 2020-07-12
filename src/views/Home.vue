<template>
  <div class="home">
    <markdown :markdown="hoge"/>
  </div>
</template>

<script>
// @ is an alias to /src
import Markdown from '@/components/Markdown.vue'
import hoge from '@/assets/md/hoge.md'
import filenames from '../../filenames.md'

export default {
  name: 'Home',
  components: {
    Markdown
  },
  data(){
    return {
      hoge,
      filenames
    }
  }
}
</script>
