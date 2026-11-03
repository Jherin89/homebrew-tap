class Tidy < Formula
  desc "Rules-driven cleanup for a messy Downloads folder"
  homepage "https://github.com/Jherin89/tidy"
  license "MIT"

  # One universal (arm64 + x86_64) archive serves both Mac architectures.
  on_macos do
    on_arm do
      url "https://github.com/Jherin89/tidy/releases/download/v0.4.0/tidy-0.4.0-universal-apple-darwin.tar.gz"
      sha256 "808dbbb30f900e32ab34b1cf763fad9db69f7925128fdbc94c69db004886efd4"
    end
    on_intel do
      url "https://github.com/Jherin89/tidy/releases/download/v0.4.0/tidy-0.4.0-universal-apple-darwin.tar.gz"
      sha256 "808dbbb30f900e32ab34b1cf763fad9db69f7925128fdbc94c69db004886efd4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Jherin89/tidy/releases/download/v0.4.0/tidy-0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f61520ff919d5068886075ce707bb4b7382650a0462706e294145f87a7e12ab3"
    end
    on_arm do
      url "https://github.com/Jherin89/tidy/releases/download/v0.4.0/tidy-0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ff12dd1b3353a3adbff328e110866559b9ae61cda0f972caa020c0025525699b"
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
