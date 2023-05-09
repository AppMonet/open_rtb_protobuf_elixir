defmodule OpenRtbProtobufTest do
  use ExUnit.Case
  doctest OpenRtbProtobuf
  alias Com.Google.Openrtb.BidRequest

  test "Encode & decode BidRequest" do
    input = %BidRequest{
      id: "63f5caf0-ae62-4ae8-8500-f2ffaaa4337a",
      imp: [
        %BidRequest.Imp{
          id: "1",
          banner: %BidRequest.Imp.Banner{
            format: [
              %BidRequest.Imp.Banner.Format{
                w: 300,
                h: 250
              }
            ],
            w: 300,
            h: 250
          },
          video: %BidRequest.Imp.Video{
            mimes: ["video/mp4"],
            w: 300,
            h: 250,
            skipmin: 0,
            skipafter: 0,
            boxingallowed: true
          },
          native: %BidRequest.Imp.Native{
            request_oneof: {:request, "{}"},
            ver: "1.1"
          },
          displaymanager: "8 | FOLD Cultivation",
          displaymanagerver: "4.20",
          instl: false,
          bidfloor: 0.01,
          bidfloorcur: "USD"
        }
      ],
      distributionchannel_oneof:
        {:site,
         %BidRequest.Site{
           domain: "bobvila.com",
           page:
             "https://www.bobvila.com/slideshow/25-plants-that-survive-with-or-without-you-50159"
         }},
      device: %BidRequest.Device{
        ua:
          "Mozilla/5.0 (Linux; Android 5.1.1; SM-G928X Build/LMY47X) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Mobile Safari/537.36",
        geo: %BidRequest.Geo{
          lat: 40.71074,
          lon: -74.0070325,
          country: "USA"
        },
        ip: "3.104.245.125",
        h: 900,
        w: 400
      },
      test: false,
      at: :SECOND_PRICE,
      allimps: false
    }

    {:ok, encoded} = BidRequest.encode(input)
    assert {:ok, input} == BidRequest.decode(IO.iodata_to_binary(encoded))
  end
end
