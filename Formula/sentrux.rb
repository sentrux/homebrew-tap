class Sentrux < Formula
  desc "Live codebase visualization and structural quality gate"
  homepage "https://sentrux.dev"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sentrux/sentrux/releases/download/v0.1.1/sentrux-darwin-arm64"
      sha256 "0e773f13119ee644c610462bfc9c4f9f05230551b5cf2e923982b18067bc67bd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sentrux/sentrux/releases/download/v0.1.1/sentrux-linux-x86_64"
      sha256 "fca65057bc711b3c816e0d028bdfaa37702ca793227a61617f14d4cacd9201da"
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
