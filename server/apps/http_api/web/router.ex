defmodule HttpApi.Router do
  use HttpApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HttpApi do
    pipe_through :api
  end
end
