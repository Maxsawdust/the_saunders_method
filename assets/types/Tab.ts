type Tab = {
  title: string;
  method_type: string;
  settings_map: {
    http_method_type: string;
    scraping_worker: string;
    proxy_type: string;
    proxy_location: string;
  };
  active: boolean;
  id: number;
};

export default Tab;
