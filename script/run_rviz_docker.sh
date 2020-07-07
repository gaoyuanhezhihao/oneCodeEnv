docker run -it \
    --runtime=nvidia \
    --net=host \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --privileged \
    -e DISPLAY=$DISPLAY \
    -e PATH="/usr/lib/nvidia-418/bin:/opt/ros/kinetic/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" \
    -e LD_LIBRARY_PATH="/usr/lib/nvidia-418:/usr/lib32/nvidia-418:/opt/ros/kinetic/lib:/opt/ros/kinetic/lib/x86_64-linux-gnu" \
    -v /usr/lib/nvidia-418:/usr/lib/nvidia-418 \
    -v /usr/lib32/nvidia-418:/usr/lib32/nvidia-418 \
    --device /dev/dri \
    osrf/ros:kinetic-desktop-full


#docker run -it \
    #--runtime=nvidia \
    #--net=host \
    #--env="DISPLAY" \
    #--env="QT_X11_NO_MITSHM=1" \
    #--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    #osrf/ros:kinetic-desktop-full
#export containerId=$(docker ps -l -q)
