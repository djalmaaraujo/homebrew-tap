cask "claude-usage-menubar" do
  version "1.8.0"
  sha256 "56ae5d6a07b4bb477858ba6f198363009e0c08b81777ef3970b6d11274ccc574"

  url "https://github.com/djalmaaraujo/claude-usage-menubar/releases/download/v#{version}/ClaudeUsage.app.zip"
  name "Claude Usage"
  desc "Claude Code quota, live in the menu bar"
  homepage "https://github.com/djalmaaraujo/claude-usage-menubar"

  depends_on arch: :arm64

  app "ClaudeUsage.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{staged_path}/ClaudeUsage.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.djalma.claudeusage.plist",
  ]
end
