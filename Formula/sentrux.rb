class Sentrux < Formula
  desc "Live codebase visualization and structural quality gate"
  homepage "https://github.com/sentrux/sentrux"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sentrux/sentrux/releases/download/v0.3.1/sentrux-darwin-arm64"
      sha256 "eb799c5c5dcbca7385539c3ed5c67cac6167edf5e12fad3ca8e73e51f2fea34e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sentrux/sentrux/releases/download/v0.3.1/sentrux-linux-x86_64"
      sha256 "f7da50bce6468b7a7437c523b79d54ac74c941f03f2f4ee9d80fb518e8ab1655"
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
