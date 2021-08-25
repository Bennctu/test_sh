#! /bin/bash

TUM_PATH="../My_WorkSpace/vs_code_ws/src/lvio/ncrl_livins/demo/viral_results"
NAME_list=("LiVINS" "RTLIO" "LIO_SAM" "FastLIO" "ALOAM" "VINS")

GROUND_TRUTH="GroundTruth"

EVO_SETTING="--plot_relative_time --plot_mode=xy -p -a --t_max_diff 2.0"

VIR_EEE="true"
VIR_NYA="false"
VIR_SBS="false"


# Assign EEE name list
if [[ "$VIR_EEE" == "true" ]]; then
	declare -A EEE
	for (( i = 0; i < ${#NAME_list[@]}; i++ )); do
		for (( j = 1; j < 4; j++ )); do
			EEE[$i,$j]=$TUM_PATH/eee_0$j/${NAME_list[$i]}.tum
			# echo ${EEE[$i,$j]}
		done
	done

	for j in {1..3}; do
		echo $j"-th results"
		declare COMPARE_RESULTS
		for (( i = 0; i < ${#NAME_list[@]}; i++ )); do
			COMPARE_RESULTS+=" ${EEE[$i,$j]}"
		done
		evo_traj tum $COMPARE_RESULTS --ref=$TUM_PATH/eee_0$j/$GROUND_TRUTH.tum $EVO_SETTING
		COMPARE_RESULTS=""
	done
fi

# Assign NYA name list
if [[ "$VIR_NYA" == "true" ]]; then
	declare -A NYA
	for (( i = 0; i < ${#NAME_list[@]}; i++ )); do
		for (( j = 1; j < 4; j++ )); do
			NYA[$i,$j]=$TUM_PATH/nya_0$j/${NAME_list[$i]}.tum
			# echo ${NYA[$i,$j]}
		done
	done

	for j in {1..3}; do
		echo $j"-th results"
		declare COMPARE_RESULTS
		for (( i = 0; i < ${#NAME_list[@]}; i++ )); do
			COMPARE_RESULTS+=" ${NYA[$i,$j]}"
		done
		evo_traj tum $COMPARE_RESULTS --ref=$TUM_PATH/nya_0$j/$GROUND_TRUTH.tum $EVO_SETTING
		COMPARE_RESULTS=""
	done
fi

# Assign SBS name list
if [[ "$VIR_SBS" == "true" ]]; then
	declare -A SBS
	for (( i = 0; i < ${#NAME_list[@]}; i++ )); do
		for (( j = 1; j < 4; j++ )); do
			SBS[$i,$j]=$TUM_PATH/sbs_0$j/${NAME_list[$i]}.tum
			# echo ${SBS[$i,$j]}
		done
	done

	for j in {1..3}; do
		echo $j"-th results"
		declare COMPARE_RESULTS
		for (( i = 0; i < ${#NAME_list[@]}; i++ )); do
			COMPARE_RESULTS+=" ${SBS[$i,$j]}"
		done
		evo_traj tum $COMPARE_RESULTS --ref=$TUM_PATH/sbs_0$j/$GROUND_TRUTH.tum $EVO_SETTING
		COMPARE_RESULTS=""
	done
fi