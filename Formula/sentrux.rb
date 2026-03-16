class Sentrux < Formula
  desc "Live codebase visualization and structural quality gate"
  homepage "https://github.com/sentrux/sentrux"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sentrux/sentrux/releases/download/v0.5.2/sentrux-darwin-arm64"
      sha256 "328ce02959152cfcb6bb7b09d8e9d5a94f6f01b3d6065287d3d229e5bb32fc32"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sentrux/sentrux/releases/download/v0.5.2/sentrux-linux-x86_64"
      sha256 "77fffc53782f95fcc8ef35c90ad1421de8cff43dd97b1e9755bdb283b03dad11"
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
