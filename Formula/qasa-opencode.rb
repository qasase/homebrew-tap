class QasaOpencode < Formula
  desc "Read-only OpenCode wrapper for Qasa business staff"
  homepage "https://github.com/qasase/qasa-opencode"
  url "https://github.com/qasase/qasa-opencode/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "352ad7a668319f6d61abab88a5b5021bd1c56debfb8eaa0d4f657c12c226be87"
  license "MIT"

  depends_on "ruby"
  depends_on "opencode"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "qasa-opencode.gemspec"
    system "gem", "install", "--no-document", "qasa-opencode-0.2.0.gem",
           "--install-dir", libexec
    bin.install Dir["#{libexec}/bin/*"]
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    assert_match "qasa-opencode", shell_output("#{bin}/qasa-opencode version")
  end
end
