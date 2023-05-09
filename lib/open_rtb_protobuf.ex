defmodule OpenRtbProtobuf do
  @moduledoc """
  OpenRTB v2.6 Protobuf support for Elixir using [Protox](https://github.com/ahamez/protox).

  Protobuf schemas taken from [Google](https://developers.google.com/authorized-buyers/rtb/downloads/openrtb-proto).
  """
  use Protox,
    files: [
      "./protobuf/schema.proto"
    ]
end
