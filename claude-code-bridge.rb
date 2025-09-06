class ClaudeCodeBridge < Formula
  desc "Claude Code Bridge - Switch between different Claude Code service providers"
  homepage "https://github.com/iuhoay/claude-code-bridge"
  url "https://github.com/iuhoay/claude-code-bridge/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "cf0cf9ac48d4843a7c8e0809693f65eb9cefe00b4ec8bea4e6b24f5399ba0198"
  license "MIT"
  head "https://github.com/iuhoay/claude-code-bridge.git", branch: "main"

  depends_on "jq"

  def install
    bin.install "ccb"
    pkgshare.install ".claude_providers.json.example"
  end

  def post_install
    config_dir = "#{Dir.home}/.config/claude_code_bridge"
    config_file = "#{config_dir}/providers.json"

    unless File.exist?(config_file)
      ohai "Creating default configuration file..."
      mkdir_p config_dir
      cp "#{pkgshare}/.claude_providers.json.example", config_file
    end
  end

  test do
    system "#{bin}/ccb", "--help"
  end
end
