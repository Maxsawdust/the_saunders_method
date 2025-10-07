<script setup lang="ts">
import AddMethod from './buttons/AddMethod.vue';
import TabHeader from './structural/TabHeader.vue';
import TabBody from './structural/TabBody.vue';

import Tab from '../types/Tab';
import { computed, provide } from 'vue';
import Subtitle from './structural/Subtitle.vue';

const props = defineProps<{
  tabs_state: { tabs: Tab[]; total_tabs: Number };
}>();
provide('tabsState', props.tabs_state);

console.log(props.tabs_state);
const activeTab = computed(() =>
  props.tabs_state.tabs.find((tab) => tab.active == true)
);
console.log(activeTab);
</script>

<template>
  <div
    class="w-full min-h-120 py-4 bg-accent rounded-xl flex flex-col items-center justify-start"
  >
    <h1 class="text-2xl mb-2">EDIT METHOD HEADER</h1>

    <!---->

    <div
      class="relative bg-light min-h-80 w-[95%] pt-5 px-8 my-auto rounded-l flex flex-col justify-center items-center"
    >
      <!---->

      <div
        id="tab header"
        class="absolute top-[-40px] w-full h-10 gap-1 flex items-center"
      >
        <TabHeader
          v-for="(tab, index) in props.tabs_state.tabs"
          :tab="tab"
          :key="index"
        />
        <AddMethod />
      </div>
      <div v-if="props.tabs_state.total_tabs == 0" class="text-center">
        <p class="">There are {{ props.tabs_state.total_tabs }} tabs here</p>
        <p class="">click "+" to add one</p>
      </div>

      <TabBody v-else :tab="activeTab!" :key="activeTab!.id" />
    </div>
  </div>
</template>

<style scoped></style>
