# Formula template. The release workflow replaces the __PLACEHOLDERS__ and
# pushes the result to the Homebrew tap (niti-lab/homebrew-tap, Formula/ajiro-api.rb).
class AjiroApi < Formula
  desc "API definitions, regression tests and mocks for AI coding agents"
  homepage "https://github.com/niti-lab/ajiro-api"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/niti-lab/ajiro-api/releases/download/v0.2.0/ajiro-api-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "733a592fd006b144e3551efd2051c78a070e3255cfd66b635cbf6137c5b59767"
    else
      url "https://github.com/niti-lab/ajiro-api/releases/download/v0.2.0/ajiro-api-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "126f92ce399db43ee9aa8a0a60e1c94fb7dbddbdbdc2806c4fa9f392f1e45ea8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/niti-lab/ajiro-api/releases/download/v0.2.0/ajiro-api-0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "765c110d91a112981667a0366a5c22d55248e3c7e20d7323c4978044e282a3cb"
    else
      url "https://github.com/niti-lab/ajiro-api/releases/download/v0.2.0/ajiro-api-0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bdc7c4cc8835dc58069be20e4bac4975a3c5c9021db53cfb9e61f75d54576892"
    end
  end

  def install
    bin.install "ajiro-api"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajiro-api --version")
  end
end
