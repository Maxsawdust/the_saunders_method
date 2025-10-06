<script setup lang="ts">
import Tab from '../../types/Tab';
import { inject, ref } from 'vue';

type SizePattern =
  | `h-${number | string} w-${number | string}`
  | `w-${number | string} h-${number | string}`;

const props = defineProps<{
  label: string;
  initial: string;
  placeholder: string;
  size?: SizePattern;
  name: string;
  onChange: string;
  tab?: Tab;
}>();

const tabsState: any = inject('tabsState');
const activeTab = tabsState.tabs.find((tab: any) => tab.active == true);

const inputValue = ref(props.initial);
</script>

<template>
  <div
    class="relative border-2 border-dark rounded-[0.5rem]"
    :class="[
      props.size ? props.size : 'w-60 h-fit',
      {
        muted:
          activeTab.settings_map.http_method_type == 'get' &&
          props.name == 'header_post_body',
      },
    ]"
  >
    <span class="absolute top-[-35%] left-2 bg-light">{{ props.label }}</span>
    <input
      type="text"
      class="h-full w-full px-4 py-2 text-l focus:outline-accent-vibrant focus:outline-3 rounded-[0.5rem]"
      :phx-change="props.onChange"
      :phx-value-input_value="inputValue"
      v-model="inputValue"
      :name="props.name"
      autocomplete="off"
      :placeholder="props.placeholder"
    />
  </div>
</template>

<style scoped>
.muted {
  opacity: 50%;
  pointer-events: none;
}
</style>
