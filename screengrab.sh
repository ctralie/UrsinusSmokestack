Xvfb :3 -screen 0 1024x768x24 &
FrameBuf_PID=$!
echo FrameBuffer PID: $FrameBuf_PID
DISPLAY=:3 firefox https://panda.ursinus.edu/smokestack/ &
sleep 5
Firefox_PID=$!
while [ 1 ]
do
    sleep 4
    DISPLAY=:3 xdotool mousemove 300 300 click 1
    sleep 1
    filename=A_$(date '+%Y-%m-%d-%k-%M-%S')".png"
    import -display :3 -window root $filename
    sleep 4
    DISPLAY=:3 xdotool mousemove 300 300 click 1
    sleep 1
    filename=B_$(date '+%Y-%m-%d-%k-%M-%S')".png"
    import -display :3 -window root $filename
done
kill $Firefox_PID
kill $FrameBuf_PID
