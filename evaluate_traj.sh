#! /bin/bash

RESULT_DIR="../My_WorkSpace/vs_code_ws/src/lvio/ncrl_livins/demo/viral_results"
NAME_list=("LiVINS" "RTLIO" "LIO_SAM" "FastLIO" "ALOAM" "VINS")

GROUND_TRUTH="GroundTruth"

EVO_SETTING="--plot_relative_time --plot_mode=xy -p -a --t_max_diff 2.0" 

VIR_EEE="true"
VIR_NYA="false"
VIR_SBS="false"
SHOW_ALL="false"


# Assign EEE name list
if [[ "$VIR_EEE" == "true" ]]; then
	declare -A EEE
	for (( i = 0; i < ${#NAME_list[@]}; i++ )); do
		for (( j = 1; j < 4; j++ )); do
			EEE[$i,$j]=$RESULT_DIR/eee_0$j/${NAME_list[$i]}.tum
			# echo ${EEE[$i,$j]}
		done
	done

	echo "Choose the algorithm: 0:LiVINS; 1:RTLIO; 2:LIO_SAM; 3:FastLIO; 4:ALOAM; 5:VINS"
	read CHOICE
	for i in {1..3}; do
		echo ---------------------------$i-th----------------------------------
		evo_traj tum ${EEE[$CHOICE,$i]} --ref=$RESULT_DIR/eee_0$i/$GROUND_TRUTH.tum $EVO_SETTING
	done
	if [[ "$SHOW_ALL" == "true" ]]; then
		evo_traj tum ${EEE[0,$i]} ${EEE[1,$i]} ${EEE[2,$i]} ${EEE[3,$i]} ${EEE[4,$i]} ${EEE[5,$i]} --ref=$RESULT_DIR/eee_0$i/$GROUND_TRUTH.tum $EVO_SETTING
	fi
fi

# Assign NYA name list
if [[ "$VIR_NYA" == "true" ]]; then
	declare -A NYA
	for (( i = 0; i < ${#NAME_list[@]}; i++ )); do
		for (( j = 1; j < 4; j++ )); do
			NYA[$i,$j]=$RESULT_DIR/nya_0$j/${NAME_list[$i]}.tum
			# echo ${NYA[$i,$j]}
		done
	done

	echo "Choose the algorithm: 0:LiVINS; 1:RTLIO; 2:LIO_SAM; 3:FastLIO; 4:ALOAM; 5:VINS"
	read CHOICE
	for i in {1..3}; do
		echo ---------------------------$i-th----------------------------------
		evo_traj tum ${NYA[$CHOICE,$i]} --ref=$RESULT_DIR/nya_0$i/$GROUND_TRUTH.tum $EVO_SETTING
	done

	if [[ "$SHOW_ALL" == "true" ]]; then
		evo_traj tum ${NYA[0,$i]} ${NYA[1,$i]} ${NYA[2,$i]} ${NYA[3,$i]} ${NYA[4,$i]} ${NYA[5,$i]} --ref=$RESULT_DIR/nya_0$i/$GROUND_TRUTH.tum $EVO_SETTING
	fi
fi

# Assign SBS name list
if [[ "$VIR_SBS" == "true" ]]; then
	declare -A SBS
	for (( i = 0; i < ${#NAME_list[@]}; i++ )); do
		for (( j = 1; j < 4; j++ )); do
			SBS[$i,$j]=$RESULT_DIR/sbs_0$j/${NAME_list[$i]}.tum
			# echo ${SBS[$i,$j]}
		done
	done

	echo "Choose the algorithm: 0:LiVINS; 1:RTLIO; 2:LIO_SAM; 3:FastLIO; 4:ALOAM; 5:VINS"
	read CHOICE
	for i in {1..3}; do
		echo ---------------------------$i-th----------------------------------
		evo_traj tum ${SBS[$CHOICE,$i]} --ref=$RESULT_DIR/sbs_0$i/$GROUND_TRUTH.tum $EVO_SETTING
	done

	if [[ "$SHOW_ALL" == "true" ]]; then
		evo_traj tum ${SBS[0,$i]} ${SBS[1,$i]} ${SBS[2,$i]} ${SBS[3,$i]} ${SBS[4,$i]} ${SBS[5,$i]} --ref=$RESULT_DIR/sbs_0$i/$GROUND_TRUTH.tum $EVO_SETTING
	fi
fi


# declare -a EEE[3]
# for (( i = 1; i < 4; i++ )); do
# 	EEE[$i]=$RESULT_DIR/eee_0$i/$NAME1.tum
# 	echo ${EEE[$i]}
# done