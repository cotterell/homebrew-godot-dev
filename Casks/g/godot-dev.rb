cask "godot-dev" do
  version "4.5-dev5"
  sha256 "a5c2e5d7b32054bd5e1271e38cd34de99dd683bae9afaef67ce25b21281e7879"

  url "https://github.com/godotengine/godot-builds/releases/download/#{version}/Godot_v#{version}_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine Development Release"
  desc "Game development engine"
  homepage "https://godotengine.org/"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)[._-]dev(\d+)$/i)
    strategy :github_latest
  end

  depends_on macos: ">= :high_sierra"

  app "Godot.app", target: "Godot Dev.app"
  binary "#{appdir}/Godot Dev.app/Contents/MacOS/Godot", target: "godot"

  uninstall quit: "org.godotengine.godot"

  zap trash: [
    "~/Library/Application Support/Godot",
    "~/Library/Caches/Godot",
    "~/Library/Saved Application State/org.godotengine.godot.savedState",
  ]
end
