class Sentrux < Formula
  desc "Live codebase visualization and structural quality gate"
  homepage "https://sentrux.dev"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sentrux/sentrux/releases/download/v0.1.0/sentrux-darwin-arm64"
      sha256 "a6acc264f7dd212ee4d3e32b6a4a6b210991307251a14f5edab2ea8256255ccf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/sentrux/sentrux/releases/download/v0.1.0/sentrux-linux-x86_64"
      sha256 "62af42657149846cbb152548d99ed1c35d97672008ea978157f1b23b27740644"
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
