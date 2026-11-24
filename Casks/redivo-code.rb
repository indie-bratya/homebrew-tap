cask "redivo-code" do
  arch arm: "arm64", intel: "x64"

  version "0.1.11-redivo.2"
  sha256 arm:   "ade4a7f121d62faf57869598df514e4a3a29c708a4396a544beb503bfc28405e",
         intel: "03ff3563abf2e4fd26b80044b17d379ae4cb4cad0945a9029ebe271f12846639"

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
