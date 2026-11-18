# Formula template. The release workflow replaces the __PLACEHOLDERS__ and
# pushes the result to the Homebrew tap (niti-lab/homebrew-tap, Formula/ajiro-api.rb).
class AjiroApi < Formula
  desc "API definitions, regression tests and mocks for AI coding agents"
  homepage "https://github.com/niti-lab/ajiro-api"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/niti-lab/ajiro-api/releases/download/v0.2.3/ajiro-api-0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "24c3c7a93b6142ebb611b605e8cdc99034e1cf65c8d1b0c5c353c54f3b0bb903"
    else
      url "https://github.com/niti-lab/ajiro-api/releases/download/v0.2.3/ajiro-api-0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "32e09c702cae0e945cc1c302b0b44b41481d02df578dee016f6eaf0f29f10916"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/niti-lab/ajiro-api/releases/download/v0.2.3/ajiro-api-0.2.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ee2fd58835a23092cb3723c2f7023e3e436cd17cef7198ffe57d9562f27d6ad6"
    else
      url "https://github.com/niti-lab/ajiro-api/releases/download/v0.2.3/ajiro-api-0.2.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f559bedcab24caa03ff3d78ac8c454e14fbd48617d352b28f509e9dcd867a9e2"
    end
  end

  def install
    bin.install "ajiro-api"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajiro-api --version")
  end
end
