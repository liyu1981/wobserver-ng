defmodule Wobserver.Mixfile do
  use Mix.Project

  def project do
    [
      app: :wobserver_ng,
      version: "1.14.0",
      elixir: "~> 1.14",
      description: "Web based metrics, monitoring, and observer.",
      package: package(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      # Testing
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      dialyzer: [ignore_warnings: "dialyzer.ignore-warnings"],
      # Docs
      name: "Wobserver NG",
      source_url: "https://github.com/liyu1981/wobserver-ng",
      homepage_url: "https://github.com/liyu1981/wobserver-ng",
      docs: [
        main: "readme",
        extras: ["README.md", "README.orig.md"]
      ]
    ]
  end

  def package do
    [
      name: :wobserver_ng,
      maintainers: ["Yu Li"],
      licenses: ["MIT"],
      files: [
        # Elixir
        "lib/wobserver",
        "lib/wobserver_ng",
        "lib/wobserver.ex",
        "mix.exs",
        "README*",
        "LICENSE*"
      ],
      links: %{
        "GitHub" => "https://github.com/liyu1981/wobserver-ng"
      }
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [
      extra_applications: [
        :logger,
        :httpoison
      ],
      mod: {WobserverNG.Application, []}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:cowboy, "~> 2.9.0"},
      {:credo, "~> 0.7", only: [:dev, :test]},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.15", only: :dev},
      {:excoveralls, "~> 0.6", only: :test},
      {:httpoison, "~> 0.11 or ~> 0.12"},
      {:inch_ex, "~> 0.5", only: [:dev, :test]},
      {:meck, "~> 0.8.4", only: :test},
      {:plug, "~> 1.3 or ~> 1.4"},
      {:plug_cowboy, "~>2.6.0"},
      {:poison, "~> 2.0 or ~> 3.1"},
      {:websocket_client, "~> 1.2"}
    ]
  end
end
