<script setup lang="ts">
import { computed, provide } from 'vue';
import Tab from '../types/Tab';
import TabHeader from './structural/TabHeader.vue';
import AddMethod from './buttons/AddMethod.vue';
import TabBody from './structural/TabBody.vue';

const props = defineProps<{
  tabs_state: { tabs: Tab[]; total_tabs: Number };
}>();
provide('tabsState', props.tabs_state);

const activeTab = computed(() =>
  props.tabs_state.tabs.find((tab) => tab.active == true)
);
</script>

<template>
  <div
    class="w-full min-h-120 py-4 bg-accent-secondary rounded-xl flex flex-col items-center"
  >
    <h1 class="text-2xl">EDIT METHOD PARSER</h1>

    <!---->

    <div
      class="relative bg-light min-h-[70%] h-fit w-[95%] my-auto rounded-l flex justify-center items-center"
    >
      <div
        id="tab-parser"
        class="absolute top-[-40px] w-full h-10 gap-1 flex items-center"
      >
        <TabHeader
          v-for="(tab, index) in props.tabs_state.tabs"
          :tab="tab"
          :key="index"
        />
        <AddMethod click-event="add_parser_tab" />
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
