cask "memsync" do
  version "1.4.0,1"
  sha256 "4a1cd03ee715d1362f361876db5f074ba13d1052ae92f43c53e79348fb746d45"

  url "https://mem.i8l.tech/downloads/MemSync-#{version.csv.first}-#{version.csv.second}.dmg"
  name "MemSync"
  desc "One memory for Claude Code across every machine, captured on this Mac"
  homepage "https://mem.i8l.tech/"

  livecheck do
    url "https://mem.i8l.tech/appcast.xml"
    strategy :sparkle do |item|
      "#{item.short_version},#{item.version}"
    end
  end

  auto_updates true
  depends_on macos: :sonoma

  app "MemSync.app"

  uninstall launchctl: [
              "com.i8l.memsync-client",
              "com.i8l.memsync-viewer",
            ],
            quit:      "tech.i8l.memsync.mac"

  # ~/.memsync is deliberately not zapped: it holds the Mac's own memories
  # (mirror.db) and the machine token. Removing the app keeps them.
  zap trash: [
    "~/Library/Caches/tech.i8l.memsync.mac",
    "~/Library/HTTPStorages/tech.i8l.memsync.mac",
    "~/Library/LaunchAgents/com.i8l.memsync-client.plist",
    "~/Library/LaunchAgents/com.i8l.memsync-viewer.plist",
    "~/Library/Preferences/tech.i8l.memsync.mac.plist",
  ]
end
