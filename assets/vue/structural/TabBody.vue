<script setup lang="ts">
import Tab from '../../types/Tab';
import ToggleButton from '../buttons/ToggleButton.vue';
import FormInput from '../form_features/FormInput.vue';
import RadioInput from '../form_features/RadioInput.vue';
import Subtitle from './Subtitle.vue';
const props = defineProps<{
  tab: Tab;
}>();
</script>

<template>
  <div class="h-full w-full py-5">
    <form class="h-full w-full flex flex-col gap-5" @submit.enter.prevent="">
      <!-- Title input box -->
      <FormInput
        label="Header Name"
        placeholder="Enter header name here..."
        :initial="tab.title"
        name="method_title_input"
        onChange="title_changed"
      />

      <Subtitle content="URL SETTINGS" />

      <!-- Url input box -->
      <FormInput
        size="h-fit w-full"
        label="Target URL"
        placeholder="Enter target URL here..."
        :initial="'{{{url}}}'"
        name="method_url_input"
        onChange="url_changed"
      />

      <div id="http-configuration" class="flex gap-5">
        <!-- Toggle button -->
        <ToggleButton
          offState="GET"
          onState="POST"
          changeEvent="http_method_changed"
          name="http_method_toggle"
        />

        <!-- Post Body box -->
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

      <Subtitle content="CRAWL SERVICE SETTINGS" />

      <div id="provider-radios">
        <h4 class="border-b-[1.5px] border-dark-muted w-fit mb-2">
          Proxy Provider
        </h4>
        <div class="text-sm flex gap-3 items-center">
          <RadioInput
            name="proxy-provider-radios"
            id="standard-radio"
            labelContent="Standard"
          />
          <RadioInput
            name="proxy-provider-radios"
            id="scraping-bee-radio"
            labelContent="ScrapingBee"
          />
          <RadioInput
            name="proxy-provider-radios"
            id="oxylabs-radio"
            labelContent="oxylabs"
          />
        </div>
      </div>
    </form>
  </div>
</template>

<style scoped></style>
