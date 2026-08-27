cask "todo-menubar" do
  version "1.0.0"
  sha256 "bc5bf55e352f03fdd7f30faa2e3ae307e9e7f20d8e0cd4b65b9a254fe4850789"

  url "https://github.com/djalmaaraujo/todo-menubar/releases/download/v#{version}/TodoMenubar.app.zip"
  name "Todo Menubar"
  desc "Your todos, right in the menu bar, organized by workspace"
  homepage "https://github.com/djalmaaraujo/todo-menubar"

  depends_on arch: :arm64

  app "TodoMenubar.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{staged_path}/TodoMenubar.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.djalma.todobar.plist",
  ]
end
