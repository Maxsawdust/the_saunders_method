defmodule PhxVueWeb.EventHandlers.ParserEvents do
  use PhxVueWeb, :live_view
  alias PhxVueWeb.Structs.{MethodSettings, Tab}

  def add_parser_tab(socket) do
    socket =
    update(socket, :parser_tabs_state, fn state ->
      next_id = state.last_id + 1

      new_tab = %Tab{
        title: "New",
        method_type: nil,
        settings_map: %MethodSettings{
          http_method_type: "get",
          scraping_worker: :standard,
          proxy_type: nil,
          proxy_location: nil
        },
        active: true,
        id: next_id
      }

      updated_tabs = Enum.map(state.tabs, &(%{&1 | active: false}))
      %{tabs: updated_tabs ++ [new_tab], total_tabs: state.total_tabs + 1, last_id: next_id}
    end)



  {:noreply, socket}
  end
end
