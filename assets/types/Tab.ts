type Tab = {
  title: string;
  method_type: string;
  settings_map: {
    http_method_type: string;
    scraping_worker: string;
  };
  active: boolean;
  id: number;
};

export default Tab;
