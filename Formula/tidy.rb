class Tidy < Formula
  desc "Rules-driven cleanup for a messy Downloads folder"
  homepage "https://github.com/Jherin89/tidy"
  license "MIT"

  # One universal (arm64 + x86_64) archive serves both Mac architectures.
  on_macos do
    on_arm do
      url "https://github.com/Jherin89/tidy/releases/download/v0.2.0/tidy-0.2.0-universal-apple-darwin.tar.gz"
      sha256 "c7252bb66988a9071ec2174f13f87c534c2f8d2bd5552379f0a09b4bad7283e7"
    end
    on_intel do
      url "https://github.com/Jherin89/tidy/releases/download/v0.2.0/tidy-0.2.0-universal-apple-darwin.tar.gz"
      sha256 "c7252bb66988a9071ec2174f13f87c534c2f8d2bd5552379f0a09b4bad7283e7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Jherin89/tidy/releases/download/v0.2.0/tidy-0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0990c7ab322b59dff38a8dc88dd0696b8f1a7498fa3a5bd3cad7477a070cf834"
    end
    on_arm do
      url "https://github.com/Jherin89/tidy/releases/download/v0.2.0/tidy-0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bb5fd52102cee9e10b1fa395b95fdb97bb0406c1a9b5c006549ab53f0fe819f5"
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
