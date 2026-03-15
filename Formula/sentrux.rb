class Sentrux < Formula
  desc "Live codebase visualization and structural quality gate"
  homepage "https://github.com/sentrux/sentrux"
  version "0.4.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sentrux/sentrux/releases/download/v0.4.9/sentrux-darwin-arm64"
      sha256 "32837836e5ee3f3eb59a6688ceedce59cfb75a15483802950b7384bc71fb8e9d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sentrux/sentrux/releases/download/v0.4.9/sentrux-linux-x86_64"
      sha256 "69a4fadb2d972b7f37a32f75ad062fc080061f93c2543f209e1fcec72ff8e52d"
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
