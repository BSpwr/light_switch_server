defmodule LightSwitchServerWeb.Router do
  use LightSwitchServerWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", LightSwitchServerWeb do
    pipe_through(:browser)

    get("/*path", PageController, :index)
  end

  # Other scopes may use custom stacks.
  # scope "/api", LightSwitchServerWeb do
  #   pipe_through :api
  # end
end
