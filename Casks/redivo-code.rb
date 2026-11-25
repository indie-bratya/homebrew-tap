cask "redivo-code" do
  arch arm: "arm64", intel: "x64"

  version "0.1.11-redivo.11"
  sha256 arm:   "79f5befd16a93feaa921bc64bef3c349f8921b5afdfad3f72eaa0162cdebe36c",
         intel: "7d381b7d5bcbb1568119d95ab23a685cea82c081e79e11b2840a075d767b61cd"

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
