Xvfb :3 -screen 0 1024x768x24 &
FrameBuf_PID=$!
echo FrameBuffer PID: $FrameBuf_PID
DISPLAY=:3 firefox https://panda.ursinus.edu/smokestack/ &
Firefox_PID=$!
sleep 30
DISPLAY=:3 xdotool mousemove 300 300 click 1
while [ 1 ]
do
    sleep 5
    filename=$(date '+%Y-%m-%d-%k-%M-%S')".png"
    import -display :3 -window root $filename
done
kill $Firefox_PID
kill $FrameBuf_PID
