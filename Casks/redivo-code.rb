cask "redivo-code" do
  arch arm: "arm64", intel: "x64"

  version "0.1.11-redivo.10"
  sha256 arm:   "817498e43bc6282a784962f92c66e3ac50434ace76e7bcee8e983576a435029f",
         intel: "c501d77a459f2ea1463cf76c967973e0ed2ed59b8a2ef6a6d81a3efc4a4bedc9"

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
