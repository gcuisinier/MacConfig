#!/bin/bash

# Configure OSX

osascript -e 'tell application "System Preferences" to quit'
sudo -v
# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Xcode command lines tools cli
xcode-select --install
sleep 1
osascript <<EOD
  tell application "System Events"
    tell process "Install Command Line Developer Tools"
      keystroke return
      click button "Agree" of window "License Agreement"
    end tell
  end tell
EOD

# Install Homebrew

# Disable Download quarantine 
defaults write com.apple.LaunchServices LSQuarantine -bool NO

# Configure Touchpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1


# Graphical App install from Home-brew cask
brew cask install bettertouchtool path-finder flux
brew cask install google-chrome firefox
brew cask install Alfred bettertouchtool 1password sip
brew cask install dropbox iterm2 google-backup-and-sync
brew cask install visual-studio-code
Brew cask install pdfsam-basic 
brew cask install slack
brew cask install intellij-idea


brew tap caskroom/fonts
brew cask install font-fira-code

# Brew package
brew install mas coreutils diff-so-fancy mkcert nss


# Prepare Go
brew install go

# Install zsh
brew install zsh  shellcheck autojump
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/supercrabtree/k ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/k

mkdir -p $HOME/.shellrc/zshrc.d/




# Install App from Mac App Store

# Affinity Photo
mas install 824183456
# Affinity Designer
Mas install 824171161

# Configure Visual Studio Code
ode --install-extension DavidAnson.vscode-markdownlint
code --install-extension donjayamanne.githistory
code --install-extension DotJoshJohnson.xml
code --install-extension eamodio.gitlens
code --install-extension eg2.vscode-npm-script
code --install-extension esbenp.prettier-vscode
code --install-extension foxundermoon.shell-format
code --install-extension jebbs.plantuml
code --install-extension ms-vscode.Go
code --install-extension PeterJausovec.vscode-docker
code --install-extension Pivotal.vscode-boot-dev-pack
code --install-extension Pivotal.vscode-concourse
code --install-extension Pivotal.vscode-manifest-yaml
code --install-extension Pivotal.vscode-spring-boot
code --install-extension redhat.java
code --install-extension robertohuertasm.vscode-icons
code --install-extension timonwong.shellcheck
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension vscjava.vscode-java-debug
code --install-extension vscjava.vscode-java-dependency
code --install-extension vscjava.vscode-java-pack
code --install-extension vscjava.vscode-java-test
code --install-extension vscjava.vscode-maven
code --install-extension GabrielBB.vscode-lombok
code --install-extension vscjava.vscode-spring-boot-dashboard
code --install-extension vscjava.vscode-spring-initializr
code --install-extension joaompinto.asciidoctor-vscode
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension christian-kohler.path-intellisense
code --install-extension humao.rest-client





# Install GraphViz
brew install libtool
brew link libtool
brew install graphviz
brew link --overwrite graphviz

#Install Java JDK
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk8 adoptopenjdk9 adoptopenjdk11
brew install jenv maven


#Install Frontend Development tools
brew install node
brew install yarn --ignore-dependencies


npm install -g @angular/cli yo  generator-jhipster