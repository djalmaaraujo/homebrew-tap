cask "claude-usage-menubar" do
  version "1.10.0"
  sha256 "093cc8c7852c35e8604678ede5115dc2454f0b8ea31ee8e7c5596df9d2dbf413"

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
