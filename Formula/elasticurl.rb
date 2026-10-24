class Elasticurl < Formula
  desc "Tiny Rust CLI for everyday Elasticsearch requests"
  homepage "https://github.com/iagus/elasticurl"
  url "https://github.com/iagus/elasticurl/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "96f0166758ed961d1d58c38fb2912643c7dfc8e812fd88dcac4135170a964bb9"
  license "MIT"
  head "https://github.com/iagus/elasticurl.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    # build.rs generates one page per (sub)command into man/
    man1.install Dir["man/*.1"]
    # `elasticurl completions <shell>` generates for bash/zsh/fish
    generate_completions_from_executable(bin/"elasticurl", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/elasticurl --version")
    assert_path_exists man1/"elasticurl.1"
  end
end
