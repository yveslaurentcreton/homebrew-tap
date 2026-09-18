class Cretspec < Formula
  desc "Prepare a complete development project from its specification"
  homepage "https://github.com/yveslaurentcreton/CretSpec"
  license "MIT"

  depends_on "git"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yveslaurentcreton/CretSpec/releases/download/v0.4.0/cretspec-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "f91f1f1077df5b2fc66eab7eafb45c815a1f463c65adf6f868c080062da95b09"
    else
      url "https://github.com/yveslaurentcreton/CretSpec/releases/download/v0.4.0/cretspec-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "7bc6b85e1654f778581fdb09e58051d4330a26f367745d506c63f1bed694baea"
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
