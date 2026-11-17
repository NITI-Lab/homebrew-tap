# Formula template. The release workflow replaces the __PLACEHOLDERS__ and
# pushes the result to the Homebrew tap (niti-lab/homebrew-tap, Formula/ajiro-api.rb).
class AjiroApi < Formula
  desc "API definitions, regression tests and mocks for AI coding agents"
  homepage "https://github.com/niti-lab/ajiro-api"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/niti-lab/ajiro-api/releases/download/v0.1.6/ajiro-api-0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "f1cc77c9a56eabd78e836c372eb4eae8d7394f4e46f3c14640b9a8811edd9345"
    else
      url "https://github.com/niti-lab/ajiro-api/releases/download/v0.1.6/ajiro-api-0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "589ee723461ff592f3659ebf8f509b4d94a890e2637830c80a94d22027ec3e8f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/niti-lab/ajiro-api/releases/download/v0.1.6/ajiro-api-0.1.6-aarch64-unknown-linux-musl.tar.gz"
      sha256 "85ce10b0d48d76fdc7f6422ff3ee22d6196a9cd5274a55962e5fdf97df36f1a7"
    else
      url "https://github.com/niti-lab/ajiro-api/releases/download/v0.1.6/ajiro-api-0.1.6-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fed91876d18aff5a40048f2e1df4ba5aa0b3a39bec78d659836087c86015adfd"
    end
  end

  def install
    bin.install "ajiro-api"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ajiro-api --version")
  end
end
