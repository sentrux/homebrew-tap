class Sentrux < Formula
  desc "Live codebase visualization and structural quality gate"
  homepage "https://github.com/sentrux/sentrux"
  version "0.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sentrux/sentrux/releases/download/v0.4.2/sentrux-darwin-arm64"
      sha256 "30be6a5efe01339c47e85197088a0aa0a5ac16daa02e48c31457d355c879dd9c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sentrux/sentrux/releases/download/v0.4.2/sentrux-linux-x86_64"
      sha256 "00908a6fa648ad1ddb1656473261543e222c1a3450f0609a0a83334871fe498b"
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
