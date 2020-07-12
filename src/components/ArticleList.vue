<template>
  <div>
    <template v-for="(m, i) in markdowns">
      <router-link :to="{ path: 'article', query: { ...m } }" :key="i">
        <span style="font-weight: bold;">{{ m.name }}</span>
        <span>, </span>
        <span style="font-size: 14px;">{{
          'update: ' +
          m.modify.replace(/-/g, '/') +
          ', create: ' +
          new Date(m.birth)
        }}</span
        ><br />
      </router-link>
    </template>
  </div>
</template>

<script>
export default {
  props: {
    markdowns: [Array],
  },
}
</script>

<style></style>
