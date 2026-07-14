cask "claude-usage-menubar" do
  version "1.4.4"
  sha256 "479df52b37618daffb3c187e9a1bcc0df8763288e463ba24def2b896b6b38adf"

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
