class Cretspec < Formula
  desc "Prepare a complete development project from its specification"
  homepage "https://github.com/yveslaurentcreton/CretSpec"
  license "MIT"

  depends_on "git"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yveslaurentcreton/CretSpec/releases/download/v0.8.1/cretspec-0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "ee637c0e90e7a9eec016c3d37ea8ebe4944f97adbed81154dcbbcebbb2df2cde"
    else
      url "https://github.com/yveslaurentcreton/CretSpec/releases/download/v0.8.1/cretspec-0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "f514864c52176086095951c71ec7de9eb405f681105a4fde85fa7436691cc29a"
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
