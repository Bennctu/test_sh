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
