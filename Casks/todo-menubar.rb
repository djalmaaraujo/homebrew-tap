cask "todo-menubar" do
  version "1.1.0"
  sha256 "c69918aa7b5279bf7fc47e3216d52be3479c75f65e1ba7817c22fbd107422de0"

  url "https://github.com/djalmaaraujo/todo-menubar/releases/download/v#{version}/TodoMenubar.app.zip"
  name "Todo Menubar"
  desc "Your todos, right in the menu bar, organized by workspace"
  homepage "https://github.com/djalmaaraujo/todo-menubar"

  depends_on arch: :arm64
  depends_on :macos

  app "TodoMenubar.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{staged_path}}/TodoMenubar.app"]
  end

  zap trash: "~/Library/Preferences/com.djalma.todobar.plist"
end
