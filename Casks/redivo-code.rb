cask "redivo-code" do
  arch arm: "arm64", intel: "x64"

  version "0.1.11-redivo.3"
  sha256 arm:   "711f8de40fd02bea806b0901575b39a5f01ede4d3956dce9765cae500fb44a90",
         intel: "87f71229ca616379928db7bbeeaf614968827af203566b915458d4131d8ce20c"

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
