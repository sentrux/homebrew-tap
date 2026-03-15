class Sentrux < Formula
  desc "Live codebase visualization and structural quality gate"
  homepage "https://github.com/sentrux/sentrux"
  version "0.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sentrux/sentrux/releases/download/v0.4.2/sentrux-darwin-arm64"
      sha256 "e0cb68bdef14dd471f3b28b65e39f209eb7c851fb92e8d9a7505dbb85fe69ce0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sentrux/sentrux/releases/download/v0.4.2/sentrux-linux-x86_64"
      sha256 "6664a9b83a7badf3a9d2920d60be0055851bcd50a0f44f3aab2df8aa485e5402"
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
