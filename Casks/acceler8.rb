cask "acceler8" do
  version "1.7,9"
  sha256 "ee5955ad84a2a8d8d9e2f08b4c32b210ba152e60b6c8b21ed1dcdfb021e41bce"

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
