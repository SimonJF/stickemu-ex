defmodule StickemuEx.Client.Handlers.GeneralChatHandler do
  import StickemuEx.Client.Handler.PacketHandler
  use PacketHandler

  @spec handle_packet(String.t, ClientState.t) :: ClientState.t
  def handle_packet(packet, state) do
    uid = state.uid
    room_pid = state.room_pid

  end

end
