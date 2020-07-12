<template>
  <div class="home">
    <div style="display:flex;">
      <div @click="clickUpdateSort()" class="rotate" :style="updateSortStyle">⬆ <span class="rotate-word" :style="wordStyleUpdate">Update</span></div>
      <div @click="clickCreateSort()" class="rotate" :style="createSortStyle">⬆ <span class="rotate-word" :style="wordStyleCreate">Create</span></div>
    </div>
    <template v-for="(m,i) in computedMarkdowns">
      <router-link :to="{path: 'about', query: {...m}}" :key="i">
        <span style="font-weight:bold">{{m.name}}</span>
        <span>, </span>
        <span style="font-size:14px">{{'update: ' +new Date(m.modify) + ', create: ' + m.birth}}</span><br>
      </router-link>
    </template>
  </div>
</template>

<script>
import {markdowns} from '../../markdowns.js'

export default {
  data(){
    return {
      markdowns,
      updateSortFlag: false,
      createSortFlag: false,
      currentSort: 'update'
    }
  },
  computed: {
    computedMarkdowns(){
      const result= [...this.markdowns].sort((a,b)=>{
        if (this.currentSort === 'create') {
          if (this.createSortFlag) {
            return (a.birth > b.birth ? 1 : -1)
          } else {
            return (a.birth < b.birth ? 1 : -1)
          }
        } else if (this.currentSort === 'update') {
          if (this.updateSortFlag) {
            return (a.modify > b.modify ? 1 : -1)
          } else {
            return (a.modify < b.modify ? 1 : -1)
          }
        }
      })
      return result
    },
    updateSortStyle(){
      let result = ''
      if(this.updateSortFlag){
        result += 'transform:rotate(180deg);background:lightblue;'
      }
      if(this.currentSort !== 'update') {
        result += 'background:lightgrey;color:grey'
      }
      return result
    },
    createSortStyle(){
      let result = ''
      if(this.createSortFlag){
        result += 'transform:rotate(180deg);background:lightblue;'
      }
      if(this.currentSort !== 'create') {
        result += 'background:lightgrey;color:grey'
      }
      return result
    },
    wordStyleUpdate(){
      let result = ''
      if(this.updateSortFlag){
        result += 'transform:rotate(180deg);'
      }
      return result
    },
    wordStyleCreate(){
      let result = ''
      if(this.createSortFlag){
        result += 'transform:rotate(180deg);'
      }
      return result
    }
  },
  methods: {
    clickUpdateSort(){
      if (this.currentSort === 'update') {
        this.updateSortFlag = !this.updateSortFlag
      } else {
        this.currentSort = 'update'
      }
    },
    clickCreateSort(){
      if (this.currentSort === 'create') {
        this.createSortFlag = !this.createSortFlag
      } else {
        this.currentSort = 'create'
      }
    },
  },
}
</script>

<style lang="scss" scoped>
.rotate {
  display: flex;
  justify-content: center;
  align-items: center;
  width:80px;
  height:30px;
  border-radius: 4px;
  margin-right: 10px;
  margin-bottom: 20px;
  transition-duration: 1s;
  background:rgba(18,132,129,0.8);
}
.rotate-word {
  font-weight: bold;
  transition-duration: 1s;
  transition-delay: 1s;
}
</style>