class Tidy < Formula
  desc "Rules-driven cleanup for a messy Downloads folder"
  homepage "https://github.com/Jherin89/tidy"
  license "MIT"

  # One universal (arm64 + x86_64) archive serves both Mac architectures.
  on_macos do
    on_arm do
      url "https://github.com/Jherin89/tidy/releases/download/v0.5.0/tidy-0.5.0-universal-apple-darwin.tar.gz"
      sha256 "36d9177275e68187f50c83405d26bda7684932859f304ab43e44c3e298abe66f"
    end
    on_intel do
      url "https://github.com/Jherin89/tidy/releases/download/v0.5.0/tidy-0.5.0-universal-apple-darwin.tar.gz"
      sha256 "36d9177275e68187f50c83405d26bda7684932859f304ab43e44c3e298abe66f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Jherin89/tidy/releases/download/v0.5.0/tidy-0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "61d819a93af00c93fafc8d8d29fe8bf2b0e41344ce5f10faed9928a00515e851"
    end
    on_arm do
      url "https://github.com/Jherin89/tidy/releases/download/v0.5.0/tidy-0.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1b8d07b04d11fac14ce2d01c17e2db9b05751d392f1b402d464a8cf0fdc9a615"
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
