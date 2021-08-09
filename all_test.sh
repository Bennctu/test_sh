#! /bin/bash
export VIRAL_RESULT_PATH="../Downloads/NTU_VIRAL/"

# export RESULT_NAME="FastLIO"               # LiVINS
# export PACKAGE="fast_lio"                  # ncrl_livins
# export LAUNCH="mapping_ouster64"      # depth_map.launch
# export TOPIC="/Odometry"                   # /depth_map/livins_odometry

# export RESULT_NAME="LIO_SAM"               # LiVINS
# export PACKAGE="lio_sam"                  # ncrl_livins
# export LAUNCH="run_ntuviral"      # depth_map
# export TOPIC="/lio_sam/mapping/odometry_incremental"                   # /depth_map/livins_odometry

export RESULT_NAME="RTLIO"               # LiVINS
export PACKAGE="ncrl_lio"                  # ncrl_livins
export LAUNCH="run"      # depth_map
export TOPIC="/estimator/laser_odom"                   # /depth_map/livins_odometry

sh eee01.sh && 
sh eee02.sh &&
sh eee03.sh &&
sh nya01.sh &&
sh nya02.sh &&
sh nya03.sh &&
#sh sbs01.sh &&
sh sbs02.sh &&
sh sbs03.sh
