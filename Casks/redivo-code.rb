cask "redivo-code" do
  arch arm: "arm64", intel: "x64"

  version "0.1.11-redivo.5"
  sha256 arm:   "be07c53ec10108b85841c649cc73626cb54095f30d62c33de458ca5499884375",
         intel: "12dd970cbd5c24d65343e7d1f9ccca660a15facaee1e4c8e27d44d785737bcd1"

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
