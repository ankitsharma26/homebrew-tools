class Iwf < Formula
  desc "Install iwf"
  homepage "https://github.com/ankitsharma26/iwf"
  url "https://github.com/ankitsharma26/iwf/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "9daa1a00c49138da9765d7d3667756e17d6dce936538132b4b3d0f108d56d118"

  depends_on "go" => :build
  depends_on "make" => :build

  def install
    system "make", "bins"
    bin.install "iwf-server"
  end

  test do
    # Test installation
    assert_predicate bin/"iwf-server", :exist?
    assert_predicate File.stat(bin/"iwf-server").mode.to_s(8), "100755"

    # Test version output
    assert_match "iwf service version beta", shell_output("#{bin}/iwf-server -v")
  end
end
