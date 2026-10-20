class Cretspec < Formula
  desc "Prepare a complete development project from its specification"
  homepage "https://github.com/yveslaurentcreton/CretSpec"
  license "MIT"

  depends_on "git"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yveslaurentcreton/CretSpec/releases/download/v0.7.0/cretspec-0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "2f154e8e2667237b9ad092a41a447d6bae67b52a0d06f8a3919606ef54289a77"
    else
      url "https://github.com/yveslaurentcreton/CretSpec/releases/download/v0.7.0/cretspec-0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "a05dc5d27e809d6ae18ccb26b49b5e076859ea477e2615cbd168a3e7db29339a"
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
