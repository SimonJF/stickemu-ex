defmodule StickemuEx.Client.Handlers.PacketHandler do
  import StickemuEx.Client.ClientInstance

  @callback handle_packet(String.t, String.t, ClientState.t) :: ClientState.t

end
