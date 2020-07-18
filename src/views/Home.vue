<template>
  <div>
    <div style="display: flex;">
      <div
        @click="clickUpdateSort()"
        class="rotate"
        :style="updateOrderStyle.button"
      >
        <span
          poyonTargetButtonUpdate
          class="poyon"
          :style="updateOrderArrowStyle"
          >⬆</span
        >
        <span :style="updateOrderStyle.word">Update</span>
      </div>
      <div
        @click="clickCreateSort()"
        class="rotate"
        :style="createOrderStyle.button"
      >
        <span poyonTargetButtonCreate :style="createOrderArrowStyle">⬆</span>
        <span :style="createOrderStyle.word">Create</span>
      </div>
    </div>
    <article-list :markdowns="computedMarkdowns" />
  </div>
</template>

<script>
import { markdowns } from '../../markdowns.js'
import ArticleList from '@/components/ArticleList'

const buttonStyle = {
  active: 'background:#6200ee;color:#fff;font-size:20px;font-weight:bold;',
  inActive:
    'background:lightgrey;color:grey;font-size:14px;font-weight:normal;',
}
const wordStyle = {
  active: 'font-size:14px;font-weight:bold',
  inActive: 'font-size:12px;font-weight:bold;',
}
const arrowStyle = {
  active: 'transform:rotate(0deg);',
  inActive: 'transform:rotate(180deg);',
}
export default {
  components: {
    ArticleList,
  },
  data() {
    return {
      markdowns,
      updateSortFlag: false,
      createSortFlag: false,
      currentSort: 'update',
    }
  },
  computed: {
    createOrderStyle() {
      if (this.currentSort === 'create') {
        return {
          button: buttonStyle.active,
          word: wordStyle.active,
        }
      } else {
        return {
          button: buttonStyle.inActive,
          word: wordStyle.inActive,
        }
      }
    },
    updateOrderStyle() {
      if (this.currentSort === 'update') {
        return {
          button: buttonStyle.active,
          word: wordStyle.active,
        }
      } else {
        return {
          button: buttonStyle.inActive,
          word: wordStyle.inActive,
        }
      }
    },
    createOrderArrowStyle() {
      if (this.createSortFlag) {
        return arrowStyle.inActive
      } else {
        return arrowStyle.active
      }
    },
    updateOrderArrowStyle() {
      if (this.updateSortFlag) {
        return arrowStyle.inActive
      } else {
        return arrowStyle.active
      }
    },
    computedMarkdowns() {
      const result = [...this.markdowns].sort((a, b) => {
        if (this.currentSort === 'create') {
          if (this.createSortFlag) {
            return a.birth > b.birth ? 1 : -1
          } else {
            return a.birth < b.birth ? 1 : -1
          }
        } else if (this.currentSort === 'update') {
          if (this.updateSortFlag) {
            return a.modify > b.modify ? 1 : -1
          } else {
            return a.modify < b.modify ? 1 : -1
          }
        }
      })
      return result
    },
  },
  methods: {
    clickUpdateSort() {
      if (this.currentSort === 'create') {
        this.currentSort = 'update'
      } else {
        this.updateSortFlag = !this.updateSortFlag
      }
    },
    clickCreateSort() {
      if (this.currentSort === 'update') {
        this.currentSort = 'create'
      } else {
        this.createSortFlag = !this.createSortFlag
      }
    },
  },
}
</script>

<style lang="scss" scoped>
.rotate {
  cursor: pointer;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 80px;
  height: 30px;
  border-radius: 4px;
  margin-right: 10px;
  margin-bottom: 20px;
}
</style>
