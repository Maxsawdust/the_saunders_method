defmodule PhxVueWeb.Structs.MethodSettings do
  @derive LiveVue.Encoder
  defstruct [
    :http_method_type,
    :scraping_worker,
    :proxy_type,
    :proxy_location,
  ]
end
