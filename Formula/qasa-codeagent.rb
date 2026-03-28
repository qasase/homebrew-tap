class QasaCodeagent < Formula
  desc "Claude Code wrapper for Qasa business staff"
  homepage "https://github.com/qasase/qasa-opencode"
  url "https://github.com/qasase/qasa-opencode/archive/refs/tags/0.5.0.tar.gz"
  sha256 "9077110a39e0b1436ef6cb2c19602dbf5f4c17b3c0c3936c8d6b39762bdfc0a8"
  license "MIT"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "qasa-opencode.gemspec"
    system "gem", "install", "--no-document", "qasa-opencode-0.5.0.gem",
           "--install-dir", libexec
    bin.install Dir["#{libexec}/bin/*"]
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    assert_match "qasa-codeagent", shell_output("#{bin}/qasa-codeagent version")
  end
end
