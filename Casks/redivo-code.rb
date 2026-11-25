cask "redivo-code" do
  arch arm: "arm64", intel: "x64"

  version "0.1.11-redivo.9"
  sha256 arm:   "219f5acb10fa4a86b3e53cefcab21d4312bcc2949238e6327247a3c10271248c",
         intel: "26f18af8e9b2ffc7061f178e89ed1c8dfe9036011884d73598b8eef5d4cbee84"

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
