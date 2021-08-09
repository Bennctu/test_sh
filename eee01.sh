#! /bin/bash
DATA_NAME="eee_01"
RESULT_PATH=$VIRAL_RESULT_PATH$DATA_NAME
DATA_PATH=$RESULT_PATH

roslaunch $PACKAGE $LAUNCH.launch & 
rosbag record -O $RESULT_PATH/$DATA_NAME"_"$RESULT_NAME.bag $TOPIC __name:=my_bag &
rosbag play $DATA_PATH/$DATA_NAME.bag --clock -r 0.3 &&
rosnode kill /my_bag && killall -9 rosmaster
