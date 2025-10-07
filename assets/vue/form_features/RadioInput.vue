<script setup lang="ts">
import { computed, inject } from 'vue';
import Tab from '../../types/Tab';

type Props = {
  name: string;
  id: string;
  labelContent: string;
  onChange: string;
};

const props = defineProps<Props>();
const workerType = props.onChange.slice(20).replace('-', '_');

const tabsState: any = inject('tabsState');
const tab: Tab = tabsState.tabs.find((tab: any) => tab.active == true);
const selectedWorker = computed(() => tab.settings_map.scraping_worker);

console.log(selectedWorker);
console.log(workerType);
</script>

<template>
  <label :for="props.id" class="relative cursor-pointer">
    <input
      type="radio"
      :name="name"
      :id="id"
      :phx-change="onChange"
      :phx-value-radio_value="name"
      :checked="workerType == selectedWorker"
    />
    <span class="custom-radio"></span>
    {{ props.labelContent }}
  </label>
</template>

<style scoped>
input {
  appearance: none;
  -moz-appearance: none;
  -webkit-appearance: none;
  height: 1em;
  width: 1em;
  cursor: pointer;
  pointer-events: all;
}

.custom-radio {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  left: 0;
  height: 1em;
  width: 1em;
  border: 1px solid black;
  border-radius: 100%;
  pointer-events: none;
}

input + .custom-radio::after {
  content: '';
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  height: 15%;
  width: 15%;
  border-radius: 100%;
  transition: all 0.1s ease;
}

input:checked + .custom-radio::after {
  content: '';
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  height: 75%;
  width: 75%;
  border-radius: 100%;
  background-color: var(--color-accent-vibrant);
}

input:active + .custom-radio {
  background-color: var(--color-accent);
}
</style>
