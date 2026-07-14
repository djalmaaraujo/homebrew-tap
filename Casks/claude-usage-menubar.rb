cask "claude-usage-menubar" do
  version "1.4.1"
  sha256 "49a05c0444182f2bfbc5751e74ea028f135713a6eb68a474a884b818b8b0f2b4"

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
