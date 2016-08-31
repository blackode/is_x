defmodule IsX.Mixfile do
  use Mix.Project

  def project do
    [app: :is_x,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     description: description,
     package: package
   ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  defp description do
    """
    This module comprises of truth value definitions like the whether the data is empty or blank or null or nil or its length is 0 like.

    To say in one word the extended functions of value assertion functions
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["John Ankanna"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/blackode/is_x",
        "Docs" => "http://hexdocs.pm/is_x/"}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:ex_doc, "~> 0.11", only: :dev},
     {:earmark, "~> 0.1", only: :dev},
     {:dialyxir, "~> 0.3", only: [:dev]}]
  end
end
