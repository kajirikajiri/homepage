<template>
  <div class="home">
    <template v-for="(m,i) in markdowns">
      <router-link :to="{path: 'about', query: {...m}}" :key="i">
        {{m.name + ' ' + new Date(m.modify) + m.birth }}<br>
      </router-link>
    </template>
  </div>
</template>

<script>
import {markdowns} from '../../markdowns.js'

export default {
  data(){
    return {
      markdowns
    }
  }
}
</script>
