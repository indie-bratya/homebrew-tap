cask "redivo-code" do
  arch arm: "arm64", intel: "x64"

  version "0.1.11-redivo.1"
  sha256 arm:   "dc80720ce4a4e34560a39f3f0a4d9ade9c1bef98ae507163578c69cf61b6e521",
         intel: "275ecba72311fea9dee69f59a47eb5b1cdfcd7dc0aff88f40fb6b79066c35b2a"

  url "https://ai.redivo.ru/releases/files/Redivo-Code-#{version}-mac-#{arch}.dmg"
  name "Redivo Code"
  desc "Desktop IDE for Redivo AI (Antigravity, Codex, GPT Image)"
  homepage "https://code.redivo.ru"

  app "Redivo Code.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Redivo Code.app"],
                   must_succeed: false
  end

  zap trash: [
    "~/.redivo-code",
    "~/Library/Application Support/Redivo Code",
    "~/Library/Caches/ru.redivo.code",
    "~/Library/Preferences/ru.redivo.code.plist",
  ]
end
