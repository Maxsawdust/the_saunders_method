defmodule PhxVueWeb.PageLive do
  use PhxVueWeb, :live_view
  import PhxVueWeb.EventHandlers.HeaderEvents
  import PhxVueWeb.EventHandlers.ParserEvents

  def mount(_params, _session, socket) do

    tabs_state = %{
      tabs: [],
      total_tabs: 0,
      last_id: 0
    }

    new_socket =
      socket
      |> assign(header_tabs_state: tabs_state)
      |> assign(parser_tabs_state: tabs_state)

    {:ok, new_socket}
  end

  def handle_event("add_header_tab", _value, socket) do
    add_header_tab(socket)
  end
  def handle_event("add_parser_tab", _value, socket) do
    add_parser_tab(socket)
  end

  def handle_event("change_active_tab", %{"id" => value}, socket) do
   change_active_tab(value, socket)
  end

  def handle_event("title_changed", %{"method_title_input" => value}, socket) do
    title_changed(value, socket)
  end

  def handle_event("url_changed", %{"method_url_input" => _value}, socket) do
    {:noreply, socket}
  end

  def handle_event("http_method_changed", %{"http_method_toggle" => _value}, socket) do
    http_method_changed("post", socket)
  end
  def handle_event("http_method_changed", %{"_target" => ["http_method_toggle"]}, socket) do
    http_method_changed("get", socket)
  end

  def handle_event("proxy-radio-changed-standard", _value, socket) do
    proxy_radio_changed(:standard, socket)
  end
  def handle_event("proxy-radio-changed-scraping-bee", _value, socket) do
    proxy_radio_changed(:scraping_bee, socket)
  end
  def handle_event("proxy-radio-changed-oxylabs", _value, socket) do
    proxy_radio_changed(:oxylabs, socket)
  end

  def handle_event("proxy-rack-enabled", %{"proxy-rack-toggle" => _value}, socket) do
    proxy_rack_toggled(:proxy_rack, socket)
  end
  def handle_event("proxy-rack-enabled", %{"_target" => ["proxy-rack-toggle"]}, socket) do
      proxy_rack_toggled(nil, socket)
  end
end
