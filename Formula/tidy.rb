class Tidy < Formula
  desc "Rules-driven cleanup for a messy Downloads folder"
  homepage "https://github.com/Jherin89/tidy"
  license "MIT"

  # One universal (arm64 + x86_64) archive serves both Mac architectures.
  on_macos do
    on_arm do
      url "https://github.com/Jherin89/tidy/releases/download/v0.6.0/tidy-0.6.0-universal-apple-darwin.tar.gz"
      sha256 "2640558b052ae859b0fbaeb57691026883e35c103513fbff6885bfc93fd71972"
    end
    on_intel do
      url "https://github.com/Jherin89/tidy/releases/download/v0.6.0/tidy-0.6.0-universal-apple-darwin.tar.gz"
      sha256 "2640558b052ae859b0fbaeb57691026883e35c103513fbff6885bfc93fd71972"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Jherin89/tidy/releases/download/v0.6.0/tidy-0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "87271f64be8cc9e115ca95fc5028dbfe4dd674fe7a8f69a43b54602d04394ab5"
    end
    on_arm do
      url "https://github.com/Jherin89/tidy/releases/download/v0.6.0/tidy-0.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fa311aa79522d3259e0f58e356a3bcef0ec14ef9e97bd4a249869bd059989ec2"
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
