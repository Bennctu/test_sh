#! /bin/bash

VIRAL_RESULT_PATH="../Downloads/NTU_VIRAL"
RESULT_WORKSPACE="My_WorkSpace/vs_code_ws"
RESULT_NAME="GroundTruth"

MAIN_TOPIC="/leica/pose"
SUB_TOPIC="relative"
TOPIC=$MAIN_TOPIC"/"$SUB_TOPIC
USE_GT=false

echo use ground truth "[y/n]"
read GT
if [[ $GT == y ]]; then
	USE_GT=true
fi

# eee dataset
for ITER in {1..3}
do
	if [[ USE_GT ]]; then
		echo use ground truth eee_$ITER "[y/n?]"
		read VAR
		if [[ $VAR == y ]]; then
			evo_traj bag $VIRAL_RESULT_PATH/eee_0$ITER/eee_0$ITER.bag $TOPIC --save_as_tum &&
			mv $SUB_TOPIC.tum ../$RESULT_WORKSPACE/src/lvio/ncrl_livins/demo/viral_results/eee_0$ITER/$RESULT_NAME.tum
		fi
	else
		echo evaluate bag eee_$ITER "[y/n?]"
		read VAR
		if [[ $VAR == y ]]; then
			evo_traj bag $VIRAL_RESULT_PATH/eee_0$ITER/eee_0$ITER"_"$RESULT_NAME.bag $TOPIC --save_as_tum &&
			mv $SUB_TOPIC.tum ../$RESULT_WORKSPACE/src/lvio/ncrl_livins/demo/viral_results/eee_0$ITER/$RESULT_NAME.tum
		fi
	fi	
done

# nya dataset
for ITER in {1..3}
do
	if [[ USE_GT ]]; then
		echo use ground truth nya_$ITER "[y/n?]"
		read VAR
		if [[ $VAR == y ]]; then
			evo_traj bag $VIRAL_RESULT_PATH/nya_0$ITER/nya_0$ITER.bag $TOPIC --save_as_tum &&
			mv $SUB_TOPIC.tum ../$RESULT_WORKSPACE/src/lvio/ncrl_livins/demo/viral_results/nya_0$ITER/$RESULT_NAME.tum
		fi
	else
		echo evaluate bag nya_$ITER "[y/n?]"
		read VAR
		if [[ $VAR == y ]]; then
			evo_traj bag $VIRAL_RESULT_PATH/nya_0$ITER/nya_0$ITER"_"$RESULT_NAME.bag $TOPIC --save_as_tum &&
			mv $SUB_TOPIC.tum ../$RESULT_WORKSPACE/src/lvio/ncrl_livins/demo/viral_results/nya_0$ITER/$RESULT_NAME.tum
		fi
	fi
done

# sbs dataset
for ITER in {1..3}
do
	if [[ USE_GT ]]; then
		echo use ground truth sbs_$ITER "[y/n?]"
		read VAR
		if [[ $VAR == y ]]; then
			evo_traj bag $VIRAL_RESULT_PATH/sbs_0$ITER/sbs_0$ITER.bag $TOPIC --save_as_tum &&
			mv $SUB_TOPIC.tum ../$RESULT_WORKSPACE/src/lvio/ncrl_livins/demo/viral_results/sbs_0$ITER/$RESULT_NAME.tum
		fi
	else
		echo evaluate bag sbs_$ITER "[y/n?]"
		read VAR
		if [[ $VAR == y ]]; then
			evo_traj bag $VIRAL_RESULT_PATH/sbs_0$ITER/sbs_0$ITER"_"$RESULT_NAME.bag $TOPIC --save_as_tum &&
			mv $SUB_TOPIC.tum ../$RESULT_WORKSPACE/src/lvio/ncrl_livins/demo/viral_results/sbs_0$ITER/$RESULT_NAME.tum
		fi
	fi
	
done