class Cretspec < Formula
  desc "Prepare a complete development project from its specification"
  homepage "https://github.com/yveslaurentcreton/CretSpec"
  license "MIT"

  depends_on "git"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yveslaurentcreton/CretSpec/releases/download/v0.5.0/cretspec-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "c7a9d435acabdfbdf5a2d4a399cae28c74ca543bcd5191f34b57314e36080b2c"
    else
      url "https://github.com/yveslaurentcreton/CretSpec/releases/download/v0.5.0/cretspec-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "9085d58a1cd7334d02a7b2572dc87da6eefe2343e9c65d82f91140cf55766fe5"
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
