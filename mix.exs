defmodule OpenRtbProtobuf.MixProject do
  use Mix.Project

  @name "OpenRtbProtobuf"
  @version "0.1.0"
  @repo_url "https://github.com/AppMonet/open_rtb_protobuf"

  def project do
    [
      app: :open_rtb_protobuf,
      version: "0.1.1",
      elixir: "~> 1.10",
      description: "OpenRTB Protobuf support for Elixir",
      start_permanent: Mix.env() == :prod,
      package: package(),
      docs: docs(),
      name: @name,
      source_url: @repo_url,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => @repo_url},
      files: ~w(lib .formatter.exs mix.exs README* protobuf)
    ]
  end

  def docs do
    [
      source_ref: "v#{@version}",
      source_url: @repo_url,
      main: @name
    ]
  end

  defp deps do
    [
      {:protox, "~> 1.7"},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false}
    ]
  end
end
