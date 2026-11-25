cask "redivo-code" do
  arch arm: "arm64", intel: "x64"

  version "0.1.12-redivo.1"
  sha256 arm:   "dd2f1f2eb9ee5fbda4a5d4e7b47ac18a863fdf1a38a93d599b298a10d1b76f81",
         intel: "b8b46ee2fdd3cccc6261696f9fa40fa95416bd9dfa8e7af6ed38e901637a3488"

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
