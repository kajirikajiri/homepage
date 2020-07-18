<template>
  <div>
    <div>
      {{ countComputedSuccess }}
    </div>
    <div>
      {{ countComputedFailed }}
    </div>
    <div
      style="border: 1px black solid; padding: 10px;"
      @click="clickAddCounter()"
    >
      ++ count
    </div>
    <div
      style="border: 1px black solid; padding: 10px; margin-top: 20px;"
      @click="clickToggleFlag()"
    >
      toggleFlag
    </div>
  </div>
</template>

<script>
let nonReactiveFlag = false
export default {
  data() {
    return {
      counter: 0,
    }
  },
  computed: {
    countComputedSuccess() {
      if (nonReactiveFlag) return 0
      return this.counter
    },
    countComputedFailed() {
      if (!nonReactiveFlag) return 0
      return this.counter
    },
  },
  methods: {
    clickToggleFlag() {
      nonReactiveFlag = !nonReactiveFlag
      console.log(nonReactiveFlag)
    },
    clickAddCounter() {
      this.counter = this.counter + 1
    },
  },
}
</script>

<style></style>
