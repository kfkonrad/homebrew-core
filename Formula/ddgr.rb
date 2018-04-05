class Ddgr < Formula
  desc "DuckDuckGo from the terminal"
  homepage "https://github.com/jarun/ddgr"
  url "https://github.com/jarun/ddgr/archive/v1.4.tar.gz"
  sha256 "045063b4d7262992a7ea3cd9fe9715a199318828de82073f54c42631d3ef41b7"

  bottle do
    cellar :any_skip_relocation
    sha256 "ea209eb559fa4213002c5b3704f54bdd6e2a1f32095b299aee240a8d015fc6bf" => :high_sierra
    sha256 "ea209eb559fa4213002c5b3704f54bdd6e2a1f32095b299aee240a8d015fc6bf" => :sierra
    sha256 "ea209eb559fa4213002c5b3704f54bdd6e2a1f32095b299aee240a8d015fc6bf" => :el_capitan
  end

  depends_on "python"

  def install
    system "make", "install", "PREFIX=#{prefix}"
    bash_completion.install "auto-completion/bash/ddgr-completion.bash"
    fish_completion.install "auto-completion/fish/ddgr.fish"
    zsh_completion.install "auto-completion/zsh/_ddgr"
  end

  test do
    ENV["PYTHONIOENCODING"] = "utf-8"
    assert_match "Homebrew", shell_output("#{bin}/ddgr --noprompt Homebrew")
  end
end
