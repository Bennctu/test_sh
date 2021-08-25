#! /bin/bash
export VIRAL_RESULT_PATH="../Downloads/ntu_viral_dataset/"

export RESULT_NAME="LiVINS_2"
export PACKAGE="ncrl_livins"
export LAUNCH="run_indoor"
export TOPIC="/depth_map/livins_odometry"
export BAG_PARAM="--clock -r 0.3"


# export RESULT_NAME="FastLIO"
# export PACKAGE="fast_lio"  
# export LAUNCH="mapping_ouster64"
# export TOPIC="/Odometry"

# export RESULT_NAME="LIO_SAM"
# export PACKAGE="lio_sam"
# export LAUNCH="run_ntuviral"
# export TOPIC="/lio_sam/mapping/odometry_incremental"

# export RESULT_NAME="RTLIO"
# export PACKAGE="ncrl_lio"
# export LAUNCH="run"
# export TOPIC="/estimator/laser_odom"

# export RESULT_NAME="LOAM"
# export PACKAGE="loam_velodyne"
# export LAUNCH="loam_velodyne"
# export TOPIC="/integrated_to_init /aft_mapped_to_init"

sh eee01.sh && 
sh eee02.sh &&
sh eee03.sh &&
sh nya01.sh &&
sh nya02.sh &&
sh nya03.sh &&
sh sbs01.sh &&
sh sbs02.sh &&
sh sbs03.sh
