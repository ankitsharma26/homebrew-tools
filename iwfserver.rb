class iwfserver < Formula
  desc "iwf Server"
  homepage "https://github.com/ankitsharma26/iwf"
  url ".../iwf-server.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "<SHA256 CHECKSUM>"
  head "https://github.com/ankitsharma26/iwf.git"

  def install
    bin.install "iwf-server"
  end

  # Homebrew requires tests.
  test do
    assert_match "iwf service version beta", shell_output("#{bin}/iwf-server -v", 2)
  end
end
