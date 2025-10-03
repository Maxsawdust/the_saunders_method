defmodule PhxVueWeb.PageLive do
  use PhxVueWeb, :live_view
  alias PhxVueWeb.Structs.Tab
  alias PhxVueWeb.Structs.MethodSettings

  def mount(_params, _session, socket) do

    tabs_state = %{
      tabs: [],
      total_tabs: 0,
      last_id: 0
    }
    {:ok, assign(socket, tabs_state: tabs_state)}
  end

  def handle_event("add_tab", _value, socket) do
    socket =
      update(socket, :tabs_state, fn state ->
        next_id = state.last_id + 1

        new_tab = %Tab{
          title: "New",
          method_type: nil,
          settings_map: %MethodSettings{http_method_type: "get"},
          active: true,
          id: next_id
        }

        updated_tabs = Enum.map(state.tabs, &(%{&1 | active: false}))
        %{tabs: updated_tabs ++ [new_tab], total_tabs: state.total_tabs + 1, last_id: next_id}
      end)

    IO.inspect(socket)

    {:noreply, socket}
  end

  def handle_event("change_active_tab", %{"id" => value}, socket) do

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

  def handle_event("title_changed", %{"method_title_input" => value}, socket) do
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

  def handle_event("url_changed", %{"method_url_input" => _value}, socket) do
    {:noreply, socket}
  end

  def handle_event("http_method_changed", %{"http_method_toggle" => _value}, socket) do
    socket =
      update(socket, :tabs_state, fn state ->
        updated_state =
         Enum.map(state.tabs, fn
          %{active: true} = tab ->
          %{tab | settings_map: %{tab.settings_map | http_method_type: "post"}}
          tab ->
            tab
          end
        )

        %{state | tabs: updated_state}
      end)

    {:noreply, socket}
  end
  def handle_event("http_method_changed", %{"_target" => ["http_method_toggle"]}, socket) do
    socket =
      update(socket, :tabs_state, fn state ->
        updated_state =
         Enum.map(state.tabs, fn
          %{active: true} = tab ->
          %{tab | settings_map: %{tab.settings_map | http_method_type: "get"}}
          tab ->
            tab
          end
        )

        %{state | tabs: updated_state}
      end)

    {:noreply, socket}
  end
end
