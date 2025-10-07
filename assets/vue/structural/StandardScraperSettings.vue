<script setup lang="ts">
import { computed, inject } from 'vue';
import ToggleButton from '../buttons/ToggleButton.vue';
import Tab from '../../types/Tab';
import FormInput from '../form_features/FormInput.vue';
import SelectInput from '../form_features/SelectInput.vue';

const props = defineProps();

const tabState: any = inject('tabsState');
const activeTab = tabState.tabs.find((tab: Tab) => tab.active == true);
const isProxyEnabled = computed(
  () => activeTab.settings_map.proxy_type == 'proxy_rack'
);
</script>

<template>
  <div class="flex gap-20">
    <ToggleButton
      offState="No Proxy"
      onState="ProxyRack"
      changeEvent="proxy-rack-enabled"
      name="proxy-rack-toggle"
    />
    <SelectInput v-if="isProxyEnabled" />
  </div>
</template>

<style scoped></style>
