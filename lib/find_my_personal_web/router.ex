defmodule FindMyPersonalWeb.Router do
  use FindMyPersonalWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # coveralls-ignore-start
  pipeline :api do
    plug :accepts, ["json"]
  end

  # coveralls-ignore-stop

  scope "/", FindMyPersonalWeb do
    pipe_through :browser

    get "/teachers/search", TeacherController, :search
    resources "/teachers", TeacherController

    get "/members/search", MemberController, :search
    resources "/members", MemberController

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", FindMyPersonalWeb.Api, as: :api do
    pipe_through :api

    resources "/teachers", TeacherController, except: [:new, :edit]
    resources "/members", MemberController
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).

  # coveralls-ignore-start
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: FindMyPersonalWeb.Telemetry
    end
  end

  # coveralls-ignore-stop
end
