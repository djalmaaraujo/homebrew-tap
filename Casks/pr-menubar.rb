cask "pr-menubar" do
  version "1.0.0"
  sha256 "243e506ec2fa3e56d0296855885cbe9b2d4eb86010a83b96c42ed05b896e7717"

  url "https://github.com/djalmaaraujo/pr-menubar/releases/download/v#{version}/PRMenubar.app.zip"
  name "PR Menubar"
  desc "Your open GitHub pull requests, live in the menu bar"
  homepage "https://github.com/djalmaaraujo/pr-menubar"

  depends_on arch: :arm64

  app "PRMenubar.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{staged_path}/PRMenubar.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.djalma.prbar.plist",
  ]
end
