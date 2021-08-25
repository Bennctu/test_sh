#! /bin/bash

# Dataset seting
EE405="false"

VIR_EEE="false"
VIR_NYA="false"
VIR_SBS="true"

# NAME_list=("LiVINS" "LiVINS_2" "RTLIO" "LIO_SAM" "FastLIO" "ALOAM" "VINS")
NAME_list=("LiVINS_2")
GROUND_TRUTH="GroundTruth"

# evo_ape tum GroundTruth.tum LiVINS.tum -vap --pose_relation trans_part --save_results $RESULT_DIR/eee_0$i/LiVINS_APE.zip
# evo_rpe tum GroundTruth.tum LiVINS.tum -vap --delta 1 --delta_unit m --pose_relation trans_part --save_results $RESULT_DIR/eee_0$i/LiVINS_RPE.zip

if [[ "$EE405" == "true" ]]; then
	RESULT_DIR="../My_WorkSpace/vs_code_ws/src/lvio/ncrl_livins/demo/EE_405"
else
	RESULT_DIR="../My_WorkSpace/vs_code_ws/src/lvio/ncrl_livins/demo/viral_results"
fi

# Use ape or rpe to evaluation
declare METHOD
declare EVO_COMMAND
declare EVO_SETTING

echo "Use which evaluation method [ape/rpe]?"
read VAR_M
echo "evaluate position or angle [trans/deg]?"
read VAR_Part

if [[ "$VAR_M" == "ape" ]]; then
	METHOD="APE"
	EVO_COMMAND="evo_ape"
	if [[ "$VAR_Part" == "trans" ]]; then
		EVO_SETTING="-vap --t_max_diff 2.0 --pose_relation trans_part --save_results"
	else
		EVO_SETTING="-vap --t_max_diff 2.0 --pose_relation angle_deg --save_results"
	fi
	echo Use APE
elif [[ "$VAR_M" == "rpe" ]]; then
	METHOD="RPE"
	EVO_COMMAND="evo_rpe"
	if [[ "$VAR_Part" == "trans" ]]; then
		if [[ ""$EE405"" == "true" ]]; then
			EVO_SETTING="-vap --t_max_diff 2.0 --delta 0.5 --delta_unit m --pose_relation trans_part --save_results"
		else
			EVO_SETTING="-vap --t_max_diff 2.0 --delta 1 --delta_unit m --pose_relation trans_part --save_results"
		fi
	else
		if [[ ""$EE405"" == "true" ]]; then
			EVO_SETTING="-vap --t_max_diff 2.0 --delta 0.5 --delta_unit m --pose_relation angle_deg --save_results"
		else
			EVO_SETTING="-vap --t_max_diff 2.0 --delta 1 --delta_unit m --pose_relation angle_deg --save_results"
		fi
	fi
	echo USE RPE
else
	PID=$$
	sleep 2
	kill $PID # exit own program
fi

# Assign EE405 name list
if [[ "$EE405" == "true" ]]; then
	declare -A EE_INDOOR
	for ((i = 0; i < ${#NAME_list[@]}; i++)); do
		if [[ "$VAR_Part" == "trans" ]]; then
			$EVO_COMMAND tum $RESULT_DIR/$GROUND_TRUTH.tum $RESULT_DIR/${NAME_list[$i]}.tum $EVO_SETTING $RESULT_DIR/$METHOD"_position_results"/${NAME_list[$i]}"_"$METHOD.zip
		else
			$EVO_COMMAND tum $RESULT_DIR/$GROUND_TRUTH.tum $RESULT_DIR/${NAME_list[$i]}.tum $EVO_SETTING $RESULT_DIR/$METHOD"_rotation_results"/${NAME_list[$i]}"_"$METHOD.zip
		fi
	done
	if [[ "$VAR_Part" == "trans" ]]; then
		evo_res $RESULT_DIR/$METHOD"_position_results"/*.zip -p --save_table $RESULT_DIR/$METHOD"_position_table".csv
	else
		evo_res $RESULT_DIR/$METHOD"_rotation_results"/*.zip -p --save_table $RESULT_DIR/$METHOD"_rotation_table".csv
	fi
fi

# Assign EEE name list
if [[ "$VIR_EEE" == "true" ]]; then
	declare -A EEE
	for ((i = 0; i < ${#NAME_list[@]}; i++)); do
		for ((j = 1; j < 4; j++)); do
			TMP=$RESULT_DIR/eee_0$j
			EEE[$i, $j]=$TMP/${NAME_list[$i]}
			echo ---------------------------$j-th---------------------------------- &&
			echo ${EEE[$i,$j]} &&
			$EVO_COMMAND tum $RESULT_DIR/eee_0$j/$GROUND_TRUTH.tum ${EEE[$i, $j]}.tum $EVO_SETTING $TMP/$METHOD"_results"/${NAME_list[$i]}"_"$METHOD.zip
		done
	done

	for ((i = 1; i < 4; i++)); do
		evo_res $RESULT_DIR/eee_0$i/$METHOD"_results"/*.zip -p --save_table $RESULT_DIR/eee_0$i/$METHOD"_table".csv
	done
fi

# Assign NYA name list
if [[ "$VIR_NYA" == "true" ]]; then
	declare -A NYA
	for ((i = 0; i < ${#NAME_list[@]}; i++)); do
		for ((j = 1; j < 4; j++)); do
			TMP=$RESULT_DIR/nya_0$j
			NYA[$i, $j]=$TMP/${NAME_list[$i]}
			echo ---------------------------$j-th---------------------------------- &&
			echo ${NYA[$i,$j]} &&
			$EVO_COMMAND tum $RESULT_DIR/nya_0$j/$GROUND_TRUTH.tum ${NYA[$i, $j]}.tum $EVO_SETTING $TMP/$METHOD"_results"/${NAME_list[$i]}"_"$METHOD.zip
		done
	done

	for ((i = 1; i < 4; i++)); do
		evo_res $RESULT_DIR/nya_0$i/$METHOD"_results"/*.zip -p --save_table $RESULT_DIR/nya_0$i/$METHOD"_table".csv
	done
fi

# Assign SBS name list
if [[ "$VIR_SBS" == "true" ]]; then
	declare -A SBS
	for ((i = 0; i < ${#NAME_list[@]}; i++)); do
		for ((j = 1; j < 4; j++)); do
			TMP=$RESULT_DIR/sbs_0$j
			SBS[$i, $j]=$TMP/${NAME_list[$i]}
			echo ---------------------------$j-th---------------------------------- &&
			echo ${SBS[$i,$j]} &&
			$EVO_COMMAND tum $RESULT_DIR/sbs_0$j/$GROUND_TRUTH.tum ${SBS[$i, $j]}.tum $EVO_SETTING $TMP/$METHOD"_results"/${NAME_list[$i]}"_"$METHOD.zip
		done
	done

	for ((i = 1; i < 4; i++)); do
		evo_res $RESULT_DIR/sbs_0$i/$METHOD"_results"/*.zip -p --save_table $RESULT_DIR/sbs_0$i/$METHOD"_table".csv
	done
fi