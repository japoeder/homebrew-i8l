cask "acceler8" do
  version "1.9,11"
  sha256 "937c335209414f2c7caac50364ec12127b579c81c5597ebb8be925eb9a45fa54"

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
