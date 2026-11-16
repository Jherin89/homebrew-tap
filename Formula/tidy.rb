class Tidy < Formula
  desc "Rules-driven cleanup for a messy Downloads folder"
  homepage "https://github.com/Jherin89/tidy"
  license "MIT"

  # One universal (arm64 + x86_64) archive serves both Mac architectures.
  on_macos do
    on_arm do
      url "https://github.com/Jherin89/tidy/releases/download/v1.0.0/tidy-1.0.0-universal-apple-darwin.tar.gz"
      sha256 "1f08c56b2c4e5707dd804005232c3d75fd83f2bbaf21ae6547e4cf6e918c4098"
    end
    on_intel do
      url "https://github.com/Jherin89/tidy/releases/download/v1.0.0/tidy-1.0.0-universal-apple-darwin.tar.gz"
      sha256 "1f08c56b2c4e5707dd804005232c3d75fd83f2bbaf21ae6547e4cf6e918c4098"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Jherin89/tidy/releases/download/v1.0.0/tidy-1.0.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b639fa516b9c2c192952024480094357c24d24ab6541c20aaee977f2596f94cf"
    end
    on_arm do
      url "https://github.com/Jherin89/tidy/releases/download/v1.0.0/tidy-1.0.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "860f4e998214dd903cb73ca9cd029ed38a304e95b1ce70aaa66b3db0ff628a8e"
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
