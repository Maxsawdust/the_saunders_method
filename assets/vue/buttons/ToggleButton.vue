<script setup lang="ts">
import { ref } from 'vue';

const checked = ref();

const props = defineProps<{
  offState: String;
  onState: String;
  changeEvent: String;
  name: string;
}>();
</script>

<template>
  <div class="relative">
    <span id="off-state">{{ offState }}</span>
    <input
      id="toggle"
      type="checkbox"
      v-model="checked"
      :class="{ active: checked }"
      :phx-change="props.changeEvent"
      :phx-value-toggle_checked="checked"
      :name="props.name"
    />
    <span id="on-state">{{ onState }}</span>
  </div>
</template>

<style scoped>
div.relative {
  display: flex;
  align-items: center;
  gap: 5px;
}

#toggle {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  height: 20px;
  width: 40px;
  border: 2px solid var(--color-dark);
  border-radius: 10rem;
  cursor: pointer;
  transition: all ease-in-out 0.1s;
  position: relative;
}

#toggle:checked {
  background-color: var(--color-accent-vibrant);
}

#toggle::before {
  content: '';
  position: absolute;
  top: 50%;
  left: 0;
  transform: translateY(-50%);
  height: 16px;
  width: 16px;
  border-radius: 10rem;
  background-color: var(--color-accent-vibrant);
  transition: all ease-in-out 0.1s;
}

#toggle.active::before {
  background-color: var(--color-light);
  transform: translate(20px, -50%);
}
</style>
