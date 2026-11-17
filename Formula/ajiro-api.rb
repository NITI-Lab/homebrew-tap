# Formula template. The release workflow replaces the __PLACEHOLDERS__ and
# pushes the result to the Homebrew tap (niti-lab/homebrew-tap, Formula/ajiro-api.rb).
class AjiroApi < Formula
  desc "API definitions, regression tests and mocks for AI coding agents"
  homepage "https://github.com/niti-lab/ajiro-api"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/niti-lab/ajiro-api/releases/download/v0.2.2/ajiro-api-0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "fec04e5295bd832c9dd31ca755a8c3a5721421518493e22b1d1b3b16062f5542"
    else
      url "https://github.com/niti-lab/ajiro-api/releases/download/v0.2.2/ajiro-api-0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "475c7828233c6228e69bba4085dfbf28e48a778ce50ea472b1af28a3f5773adb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/niti-lab/ajiro-api/releases/download/v0.2.2/ajiro-api-0.2.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f224f0319f071489b6a84b7d19a029b308be514fb9e7cb85fe03c4f19af092f9"
    else
      url "https://github.com/niti-lab/ajiro-api/releases/download/v0.2.2/ajiro-api-0.2.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "306502865b53ee970b3fef224e942e0e724d2192fa5f253ca9b2e9b90eb07a8d"
    end
  end

  def install
    bin.install "ajiro-api"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajiro-api --version")
  end
end
