cask "redivo-code" do
  arch arm: "arm64", intel: "x64"

  version "0.1.11-redivo.6"
  sha256 arm:   "a1bf8c9c197563afbbcc7157d2c9081c069ad571bffa472309938d0225e7e51e",
         intel: "eb4710b93fec0a239cc58581c844c11271a127acd8143b48079184bfa2dac73d"

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
