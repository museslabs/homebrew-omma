class Omma < Formula
  desc "Eye-strain break reminder for the macOS menu bar"
  homepage "https://github.com/museslabs/omma"
  url "https://github.com/museslabs/omma/releases/download/v0.1.0/omma-v0.1.0-aarch64-apple-darwin.tar.gz"
  sha256 "4e3bef2888c2534c4e896b96d84c7eb0b70e54c3d636998336ef6fe7d7168ac2"
  license "GPL-3.0-or-later"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  def install
    bin.install "omma"
  end

  service do
    run opt_bin/"omma"
    keep_alive crashed: true
    process_type :interactive
    error_log_path var/"log/omma.log"
  end

  test do
    assert_match "omma #{version}", shell_output("#{bin}/omma --version")
  end
end
