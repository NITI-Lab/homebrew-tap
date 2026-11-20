# Formula template. The release workflow replaces the __PLACEHOLDERS__ and
# pushes the result to the Homebrew tap (niti-lab/homebrew-tap, Formula/ajiro-api.rb).
class AjiroApi < Formula
  desc "API definitions, regression tests and mocks for AI coding agents"
  homepage "https://github.com/niti-lab/ajiro-api"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/niti-lab/ajiro-api/releases/download/v0.2.4/ajiro-api-0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "b1bfddb2b62bd1124f1326d04e6bfb11cd27db17de5660c183587caba29368bf"
    else
      url "https://github.com/niti-lab/ajiro-api/releases/download/v0.2.4/ajiro-api-0.2.4-x86_64-apple-darwin.tar.gz"
      sha256 "0a85efcc95f6e0da22a63b02343b11f8581a6f70125e949834eaaaa787dee81c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/niti-lab/ajiro-api/releases/download/v0.2.4/ajiro-api-0.2.4-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9f5df7e97dec7021f14f7f33dd366713b41b9d472bc507656e562ba6e9510ec5"
    else
      url "https://github.com/niti-lab/ajiro-api/releases/download/v0.2.4/ajiro-api-0.2.4-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7173e7a249923eb6bfe97a9228e51ea8e2bf425333cf8e566d7b2c5b2be3b8ce"
    end
  end

  def install
    bin.install "ajiro-api"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajiro-api --version")
  end
end
