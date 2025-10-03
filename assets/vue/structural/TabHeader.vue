<script setup lang="ts">
import Tab from '../../types/Tab';
const props = defineProps<{
  tab: Tab;
}>();
</script>

<template>
  <span
    :class="`bg-light min-w-15 px-2 flex justify-center items-center ${
      props.tab.active ? 'h-10 rounded-t-sm' : 'h-8 rounded-sm'
    } cursor-pointer`"
    phx-click="change_active_tab"
    :phx-value-id="props.tab.id"
  >
    {{ props.tab.title }}
  </span>
</template>

<style></style>
