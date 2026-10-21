class Cretspec < Formula
  desc "Prepare a complete development project from its specification"
  homepage "https://github.com/yveslaurentcreton/CretSpec"
  license "MIT"

  depends_on "git"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yveslaurentcreton/CretSpec/releases/download/v0.8.0/cretspec-0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "5ed5b67c9a08b87ee48318fdb7dd01be39c6d60413e614d264772df37517442a"
    else
      url "https://github.com/yveslaurentcreton/CretSpec/releases/download/v0.8.0/cretspec-0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "8739e2f156486630eba1d484bdaf777c3c1fe2e7d6b8dd3ea48aa00c3a6600ec"
    end
  end

  def install
    bin.install "cspec"
    pkgshare.install "LICENSE", "README.md", "THIRD-PARTY.txt", "RUST-LICENSES.html"
  end

  test do
    assert_equal "cspec #{version}", shell_output("#{bin}/cspec --version").strip
    assert_match "project", shell_output("#{bin}/cspec --help")
  end
end
