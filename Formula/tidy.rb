class Tidy < Formula
  desc "Rules-driven cleanup for a messy Downloads folder"
  homepage "https://github.com/Jherin89/tidy"
  license "MIT"

  # One universal (arm64 + x86_64) archive serves both Mac architectures.
  on_macos do
    on_arm do
      url "https://github.com/Jherin89/tidy/releases/download/v0.3.0/tidy-0.3.0-universal-apple-darwin.tar.gz"
      sha256 "5012ad4191ed4fd0cda0b9d8643fdb8fc08b2f898bfb7916af52eb7240b78faf"
    end
    on_intel do
      url "https://github.com/Jherin89/tidy/releases/download/v0.3.0/tidy-0.3.0-universal-apple-darwin.tar.gz"
      sha256 "5012ad4191ed4fd0cda0b9d8643fdb8fc08b2f898bfb7916af52eb7240b78faf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Jherin89/tidy/releases/download/v0.3.0/tidy-0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "01d1354bbff061759b22b9cd07673fbbbef2e579b7d6bec4529116babfdabcb3"
    end
    on_arm do
      url "https://github.com/Jherin89/tidy/releases/download/v0.3.0/tidy-0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0c07fae552efab0bdd688040827b2fffda85dc1c089341c5bf8fc55ae51c6a17"
    end
  end

  conflicts_with "tidy-html5", because: "both install a `tidy` binary"

  def install
    bin.install "tidy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tidy --version")
    inbox = testpath/"inbox"
    inbox.mkpath
    assert_match "Nothing to do", shell_output("#{bin}/tidy #{inbox}")
  end
end
