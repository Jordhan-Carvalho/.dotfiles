imgSource="/home/$USER/Pictures/wallpapers/ai-wallpapers/quarto.jpeg"
resizedImg="/tmp/lock.png"
# The xdpyinfo command will get the screen width
convert -resize $(xdpyinfo | grep dimensions | cut -d\  -f7 | cut -dx -f1) $imgSource $resizedImg 
# Lock the screen
i3lock -u -e -i $resizedImg
# # Turn the screen off after a delay.
sleep 60; pgrep i3lock && xset dpms force off
