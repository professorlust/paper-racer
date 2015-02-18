defmodule PaperRacer.RaceChannel do
  use Phoenix.Channel
  require Logger
  
  def join("race:" <> _race_id, message, socket) do
    Logger.debug "JOIN #{socket.topic}"
    reply socket, "join", %{status: "connected"}
    broadcast socket, "user:entered", %{user: message}
    {:ok, socket}
  end
  
  def leave(reason, socket) do
    Logger.error inspect(reason)
    {:ok, socket}
  end
end
