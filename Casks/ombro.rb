cask "ombro" do
  version "0.5.0"
  sha256 "c938db1209760d84710e085c3ef6d79c3a67c458d28a611a0d06a1a8c80363bb"

  url "https://github.com/mrkrsl/ombro/releases/download/v#{version}/Ombro_#{version}_arm64.dmg",
      verified: "github.com/mrkrsl/ombro/"
  name "Ombro"
  desc "Crew of AI agents, briefed by you and working in the background"
  homepage "https://ombro.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on :macos

  app "Ombro.app"

  # Only the app's own files. Your settings (~/.config/ombro) and your jobs and chats (~/Ombro)
  # are shared with the ombro command, so they stay.
  zap trash: [
    "~/Library/Application Support/app.ombro.desktop",
    "~/Library/Caches/app.ombro.desktop",
    "~/Library/Logs/app.ombro.desktop",
    "~/Library/Preferences/app.ombro.desktop.plist",
    "~/Library/Saved Application State/app.ombro.desktop.savedState",
    "~/Library/WebKit/app.ombro.desktop",
  ]
end
