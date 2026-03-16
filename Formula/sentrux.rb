class Sentrux < Formula
  desc "Live codebase visualization and structural quality gate"
  homepage "https://github.com/sentrux/sentrux"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sentrux/sentrux/releases/download/v0.5.0/sentrux-darwin-arm64"
      sha256 "3366f353ba8306ef94e61f17b9fe8113ef7a2826807e0d26f5bb5e1feeee1740"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sentrux/sentrux/releases/download/v0.5.0/sentrux-linux-x86_64"
      sha256 "2c9b30c54b1552574061e0040e910a13ed47d7b36abfee6897f1f4f285e5bfac"
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
