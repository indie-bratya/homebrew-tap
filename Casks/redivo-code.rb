cask "redivo-code" do
  arch arm: "arm64", intel: "x64"

  version "0.1.11-redivo.8"
  sha256 arm:   "60924f0c98e2029eb419005ec17ae0e66e49058add549162e136f64a85186121",
         intel: "a4ec325ed12b8df4937c4f20c8aa7acecf2aea7c94e98c42f8c23b243ca97568"

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
