defmodule PhxVueWeb.Structs.Tab do
  @derive LiveVue.Encoder
  defstruct [
    :id,
    :title,
    :method_type,
    :settings_map,
    :active
  ]

end
