<template>
  <div>
    <div style="display: flex;">
      <div
        @click="clickUpdateSort()"
        class="rotate"
        :style="styleSortUpdateButton"
      >
        <span poyonTargetButtonUpdate class="poyon">⬆</span>
        <span :style="wordStyleSortUpdate">Update</span>
      </div>
      <div
        @click="clickCreateSort()"
        class="rotate"
        :style="styleSortCreateButton"
      >
        <span poyonTargetButtonCreate>⬆</span>
        <span :style="wordStyleSortCreate">Create</span>
      </div>
    </div>
    <article-list :markdowns="computedMarkdowns" />
  </div>
</template>

<script>
import { markdowns } from '../../markdowns.js'
import ArticleList from '@/components/ArticleList'

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
      styleSortUpdateButton: 'background:#6200ee;color:#fff;',
      styleSortCreateButton: 'background:lightgrey;color:grey',
      wordStyleSortUpdate: 'font-weight:bold;font-size:12px;',
      wordStyleSortCreate: 'font-weight:bold;font-size:12px;',
    }
  },
  computed: {
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
      this.poyon('poyonTargetButtonUpdate')
      if (this.currentSort === 'update' && this.updateSortFlag) {
        this.updateSortFlag = !this.updateSortFlag
        this.styleSortUpdateButton =
          'transform:rotate(180deg);background:#3700b3;transition: transform 1s;color:#fff'
        this.wordStyleSortUpdate =
          'transform:rotate(-180deg);transition: transform 0.5s 1s;'
      } else if (this.currentSort === 'update' && !this.updateSortFlag) {
        this.updateSortFlag = !this.updateSortFlag
        this.styleSortUpdateButton =
          'transform:rotate(360deg);background:#6200ee;transition: transform 1s;color:#fff'
        this.wordStyleSortUpdate =
          'transform:rotate(-360deg);transition: transform 0.5s 1s;'
      } else if (this.currentSort === 'create' && this.updateSortFlag) {
        this.currentSort = 'update'
        this.styleSortCreateButton = 'background:lightgrey;color:grey'
        this.styleSortUpdateButton = 'color:#fff;background:#3700b3;'
        this.wordStyleSortUpdate =
          'transform:rotate(-180deg);transition: transform 0.5s 1s;'
      } else if (this.currentSort === 'create' && !this.updateSortFlag) {
        this.currentSort = 'update'
        this.styleSortCreateButton = 'background:lightgrey;color:grey'
        this.styleSortUpdateButton = 'color:#fff;background:#6200ee;'
        this.wordStyleSortUpdate =
          'transform:rotate(-360deg);transition: transform 0.5s 1s;'
      }
    },
    clickCreateSort() {
      this.poyon('poyonTargetButtonCreate')
      if (this.currentSort === 'create' && this.createSortFlag) {
        this.createSortFlag = !this.createSortFlag
        this.styleSortCreateButton =
          'transform:rotate(180deg);background:#3700b3;transition: transform 1s;color:#fff'
        this.wordStyleSortCreate =
          'transform:rotate(-180deg);transition: transform 0.5s 1s;'
      } else if (this.currentSort === 'create' && !this.createSortFlag) {
        this.createSortFlag = !this.createSortFlag
        this.styleSortCreateButton =
          'transform:rotate(360deg);background:#6200ee;transition: transform 1s;color:#fff'
        this.wordStyleSortCreate =
          'transform:rotate(-360deg);transition: transform 0.5s 1s;'
      } else if (this.currentSort === 'update' && this.createSortFlag) {
        this.currentSort = 'create'
        this.styleSortUpdateButton = 'background:lightgrey;color:grey'
        this.styleSortCreateButton = 'color:#fff;background:#3700b3;'
        this.wordStyleSortCreate =
          'transform:rotate(-180deg);transition: transform 0.5s 1s;'
      } else if (this.currentSort === 'update' && !this.createSortFlag) {
        this.currentSort = 'create'
        this.styleSortUpdateButton = 'background:lightgrey;color:grey'
        this.styleSortCreateButton = 'color:#fff;background:#6200ee;'
        this.wordStyleSortCreate =
          'transform:rotate(-360deg);transition: transform 0.5s 1s;'
      }
    },
    poyon(target) {
      const element = document.querySelector('[' + target + ']')
      element.classList.add('poyon')
      setTimeout(() => {
        element.className = ''
      }, 2000)
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
.poyon {
  font-weight: bold;
  font-size: 20px;
  animation: poyon 0.9s linear 1s 1;
}
@keyframes poyon {
  0% {
    transform: scale(1, 1) translate(0%, 0%);
  }
  10% {
    transform: scale(1.1, 0.9) translate(0%, 5%);
  }
  40% {
    transform: scale(1.2, 0.8) translate(0%, 15%);
  }
  50% {
    transform: scale(1, 1) translate(0%, 0%);
  }
  60% {
    transform: scale(0.9, 1.2) translate(0%, -100%);
  }
  75% {
    transform: scale(0.9, 1.2) translate(0%, -20%);
  }
  85% {
    transform: scale(1.2, 0.8) translate(0%, 15%);
  }
  100% {
    transform: scale(1, 1) translate(0%, 0%);
  }
}
</style>
