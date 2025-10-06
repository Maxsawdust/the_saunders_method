<script setup lang="ts">
const props = defineProps<{ content: string }>();
</script>

<template>
  <div
    class="w-full flex mt-5 justify-between items-center gap-5 text-dark-semi-muted"
  >
    <span class="line"></span>
    <h3 id="subtitle">{{ props.content }}</h3>
    <span class="line"></span>
  </div>
</template>

<style scoped>
.line {
  height: 2px;
  flex: 1;
  border: 1.5px solid var(--color-dark-muted);
}
</style>
