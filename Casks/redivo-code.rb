cask "redivo-code" do
  arch arm: "arm64", intel: "x64"

  version "0.1.11-redivo.4"
  sha256 arm:   "754ba415bf94ec31fcc3a3e2aa075d87d1a00d1d310de67e209650ed6af706f2",
         intel: "a817912095d59878b1c08830e3d3828fc2ddf45bf8b8ae022919094976cd30b9"

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
