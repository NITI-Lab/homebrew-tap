# Formula template. The release workflow replaces the __PLACEHOLDERS__ and
# pushes the result to the Homebrew tap (niti-lab/homebrew-tap, Formula/ajiro-api.rb).
class AjiroApi < Formula
  desc "API definitions, regression tests and mocks for AI coding agents"
  homepage "https://github.com/niti-lab/ajiro-api"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/niti-lab/ajiro-api/releases/download/v0.2.1/ajiro-api-0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "8caba76a00a774708f9b1fadc581655fd0e315380982446ce6511529d03d4781"
    else
      url "https://github.com/niti-lab/ajiro-api/releases/download/v0.2.1/ajiro-api-0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "00425b03e505f221f6d3ea292354f87364ce471b376675e34904dc5cdbe62fcd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/niti-lab/ajiro-api/releases/download/v0.2.1/ajiro-api-0.2.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "01e4c8b7ab28cf758e7dc2a02ab0ecc8aaad09d0c1cdcb4bdc268ef365272c14"
    else
      url "https://github.com/niti-lab/ajiro-api/releases/download/v0.2.1/ajiro-api-0.2.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6d44e5cfb3ce3a2d722ae7a441a25c83df298fd47a1911d06254ffa4111a232e"
    end
  end

  def install
    bin.install "ajiro-api"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajiro-api --version")
  end
end
