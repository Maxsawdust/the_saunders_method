<script setup lang="ts">
import Tab from '../../types/Tab';
import ToggleButton from '../buttons/ToggleButton.vue';
import FormInput from '../form_features/FormInput.vue';
const props = defineProps<{
  tab: Tab;
}>();
</script>

<template>
  <div class="h-full w-full p-8">
    <form class="h-full w-full flex flex-col gap-5" @submit.enter.prevent="">
      <!-- Title input box -->
      <FormInput
        label="Header Name"
        placeholder="Enter header name here..."
        :initial="tab.title"
        name="method_title_input"
        onChange="title_changed"
      />

      <FormInput
        size="h-fit w-full"
        label="Target URL"
        placeholder="Enter target URL here..."
        :initial="'{{{url}}}'"
        name="method_url_input"
        onChange="url_changed"
      />

      <div id="http-configuration" class="flex gap-5">
        <ToggleButton
          offState="GET"
          onState="POST"
          changeEvent="http_method_changed"
          name="http_method_toggle"
        />

        <FormInput
          size="h-fit w-full"
          label="Post Body"
          placeholder="Enter post body here..."
          :initial="''"
          name="header_post_body"
          onChange="post_body_changed"
          :tab="tab"
        />
      </div>
    </form>
  </div>
</template>

<style scoped></style>
