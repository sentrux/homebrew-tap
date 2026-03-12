class Sentrux < Formula
  desc "Live codebase visualization and structural quality gate"
  homepage "https://sentrux.dev"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sentrux/sentrux/releases/download/v0.1.2/sentrux-darwin-arm64"
      sha256 "4627f9a6864187d53617f7124e463c047b1f87a223168a9e187b30f61cd097ad"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sentrux/sentrux/releases/download/v0.1.2/sentrux-linux-x86_64"
      sha256 "67a179ba6277a9c2e56be1b0000beef03a4a132866e1a6e54ef030327b4a55e2"
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
