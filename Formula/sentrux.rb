class Sentrux < Formula
  desc "Live codebase visualization and structural quality gate"
  homepage "https://github.com/sentrux/sentrux"
  version "0.3.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sentrux/sentrux/releases/download/v0.3.10/sentrux-darwin-arm64"
      sha256 "49501885ff057feb3f8cafa9f1dcaf580a0379b8652306b2fea6f52b74d61ac0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sentrux/sentrux/releases/download/v0.3.10/sentrux-linux-x86_64"
      sha256 "d1ee400c4cde94aa471205a8491f08dbf445b3c7d7a8edba14cbae538cc3cc4a"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "sentrux-darwin-arm64" => "sentrux"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "sentrux-linux-x86_64" => "sentrux"
    end
  end

  test do
    assert_match "sentrux", shell_output("#{bin}/sentrux --help 2>&1", 1)
  end
end
