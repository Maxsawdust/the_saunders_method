defmodule PhxVueWeb.PageController do
  use PhxVueWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
