cask "acceler8" do
  version "1.1,3"
  sha256 "6943fd3c75b22f5d39b23b9a53988e121d68f7043e74a76a7bae7a3fbef19596"

  url "https://acceler8.i8l.tech/downloads/acceler8-#{version.csv.first}-#{version.csv.second}.dmg"
  name "acceler8"
  desc "Windows-style Alt key sequences for Excel on macOS"
  homepage "https://acceler8.i8l.tech/"

  livecheck do
    url "https://acceler8.i8l.tech/appcast.xml"
    strategy :sparkle do |item|
      "#{item.short_version},#{item.version}"
    end
  end

  auto_updates true
  depends_on macos: :sonoma

  app "acceler8.app"

  uninstall quit: "tech.i8l.acceler8"

  zap trash: [
    "~/Library/Application Support/acceler8",
    "~/Library/Caches/tech.i8l.acceler8",
    "~/Library/HTTPStorages/tech.i8l.acceler8",
    "~/Library/Logs/acceler8.log",
    "~/Library/Preferences/tech.i8l.acceler8.plist",
  ]
end
