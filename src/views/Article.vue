<template>
  <div
    style="padding-bottom: 90px; display: flex; flex-wrap: wrap; width: 100%;"
  >
    <div style="font-size: 18px; font-weight: bold; margin-bottom: 10px;">
      {{ $route.query.name }}
    </div>
    <div>更新:{{ $route.query.modify.replace(/-/g, '/') }}</div>
    <div>作成:{{ new Date($route.query.birth) }}</div>
    <hr style="border-width: 2px;" />
    <vue-markdown
      class="target"
      style="word-break: break-all;"
      :source="markdown"
    />
  </div>
</template>

<script>
import '../plugins/google-code-prettify/run_prettify'

export default {
  data() {
    return {
      markdown: '',
    }
  },
  created() {
    const a = require(`../assets/md/${this.$route.query.name}`) // eslint-disable-line
    this.markdown = a.default
  },
  mounted() {
    const elements = document.querySelectorAll('.target pre')
    if (!elements) return

    elements.forEach((element) => {
      if (!element) return

      element.className = 'prettyprint'
      element.style.width = '93%'
    })

    this.$nextTick(function () {
      PR.prettyPrint() //eslint-disable-line
    })
  },
}
</script>

<style scoped lang="scss">
@import '../plugins/google-code-prettify/prettify.css';
@import '../plugins/google-code-prettify/skins/doxy.css';
</style>
