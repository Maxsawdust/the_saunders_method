defmodule PhxVueWeb.EventHandlers.HeaderEvents do
  use PhxVueWeb, :live_view
  alias PhxVueWeb.Structs.{MethodSettings, Tab}

  def add_tab(socket) do
    socket =
      update(socket, :tabs_state, fn state ->
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

  def change_active_tab(value, socket) do
     # IO.puts(value)
    socket =
      update(socket, :tabs_state, fn state ->
        int_value = String.to_integer(value)
        new_tabs_state =
          Enum.map(state.tabs, fn
            %{id: id} = tab
              when id == int_value ->
                %{tab | active: true}
            tab ->
              %{tab | active: false}
          end)

          %{state | tabs: new_tabs_state}
        end)
    # IO.inspect(socket)
    {:noreply, socket}
  end

  def title_changed(value, socket) do
    IO.inspect(value)
    socket =
      update(socket, :tabs_state, fn state ->
        updated_state =
          Enum.map(state.tabs, fn
            %{active: true} = tab ->
              %{tab | title: value}
            tab ->
              tab
            end
          )
        %{state | tabs: updated_state}
      end)

    {:noreply, socket}
  end

  def http_method_changed(value, socket) do
    socket =
      update(socket, :tabs_state, fn state ->
        updated_state =
         Enum.map(state.tabs, fn
          %{active: true} = tab ->
          %{tab | settings_map: %{tab.settings_map | http_method_type: value}}
          tab ->
            tab
          end
        )

        %{state | tabs: updated_state}
      end)

    {:noreply, socket}
  end

  def proxy_radio_changed(value, socket) do
    socket = update(socket, :tabs_state, fn state ->
      updated_state =
        Enum.map(state.tabs, fn
          %{active: true} = tab ->
            %{tab | settings_map: %{tab.settings_map | scraping_worker: value}}
          tab ->
            tab
          end)

      %{state | tabs: updated_state}
    end)

    {:noreply, socket}
  end

  def proxy_rack_toggled(value, socket) do
        socket =
      update(socket, :tabs_state, fn state ->
        %{state | tabs:
          Enum.map(state.tabs, fn
            %{active: true} = tab ->
              %{tab | settings_map: %{tab.settings_map | proxy_type: value}}
            tab ->
              tab
          end)
        }
      end)

    {:noreply, socket}
  end
end
