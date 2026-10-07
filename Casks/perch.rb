cask "perch" do
  version "1.6.9,50"
  sha256 "effc2715d55fbabc998c9e80520ba6ec234a23193203d42b940b9934d07c2a54"

  url "https://perch.i8l.tech/downloads/Perch-#{version.csv.first}-#{version.csv.second}.dmg"
  name "Perch"
  desc "Coding agent status in the notch"
  homepage "https://perch.i8l.tech/"

  livecheck do
    url "https://perch.i8l.tech/appcast.xml"
    strategy :sparkle do |item|
      "#{item.short_version},#{item.version}"
    end
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Perch.app"

  uninstall launchctl: [
              "tech.i8l.perch",
              "tech.i8l.perch.watch",
            ],
            quit:      "tech.i8l.perch"

  zap trash: [
    "~/.perch",
    "~/Library/Application Support/tech.i8l.perch",
    "~/Library/Caches/tech.i8l.perch",
    "~/Library/HTTPStorages/tech.i8l.perch",
    "~/Library/LaunchAgents/tech.i8l.perch.plist",
    "~/Library/LaunchAgents/tech.i8l.perch.watch.plist",
    "~/Library/Preferences/tech.i8l.perch.plist",
  ]
end
