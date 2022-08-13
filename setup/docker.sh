echo "Install Docker"
curl https://desktop.docker.com/mac/main/arm64/Docker.dmg --output $USER_DIR/Downloads/Docker.dmg
sudo hdiutil attach $USER_DIR/Downloads/Docker.dmg
sudo /Volumes/Docker/Docker.app/Contents/MacOS/install
sudo hdiutil detach /Volumes/Docker