cask "claude-usage-menubar" do
  version "1.6.1"
  sha256 "e8cca6bff6f079f34ff97288b0b2ac189c893335d92f87423d73d864b4d4edcc"

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
