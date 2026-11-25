cask "redivo-code" do
  arch arm: "arm64", intel: "x64"

  version "0.1.11-redivo.7"
  sha256 arm:   "40d5419895f53b63fcb3f80e03ec67b5dbc3260c126f0c4b7ae10c8561c0bad0",
         intel: "75ffee9fb35f4c217815b2d218a7057e1a26feb57573e7e83d3ad2776dd1e310"

  url "https://ai.redivo.ru/releases/files/Redivo-Code-#{version}-mac-#{arch}.dmg"
  name "Redivo Code"
  desc "Redivo AI desktop IDE"
  homepage "https://code.redivo.ru"

  auto_updates true
  depends_on macos: ">= :ventura"

  app "Redivo Code.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Redivo Code.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/redivo-code",
    "~/.redivo-code",
  ]
end
