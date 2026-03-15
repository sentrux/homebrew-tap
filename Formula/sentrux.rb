class Sentrux < Formula
  desc "Live codebase visualization and structural quality gate"
  homepage "https://github.com/sentrux/sentrux"
  version "0.4.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sentrux/sentrux/releases/download/v0.4.7/sentrux-darwin-arm64"
      sha256 "e016e189a6238ef9c98f1a3def75a8788ba4c78b5c01d57dbd7037224f1720b3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sentrux/sentrux/releases/download/v0.4.7/sentrux-linux-x86_64"
      sha256 "32d612e36f7e6b5f9fb9ebcb70a91d3f51cc47d60f0518dac9d76d6a930daf7a"
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
