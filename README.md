# Test sh

- These scripts are used to test the NTU VIRAL dataset or NCRL flight dataset.

## Directly run

- 1. If we record the bag of our algorithm results, please modify the params in ```all_test.sh```.

```
    VIRAL_RESULT_PATH: your relative path of VIRAL dataset
    PACAKAGE and LAUNCH: the setting of your test launch
    TOPIC: the ros topic which you want to record 
```

- 2. After getting the bags, run ```evo2tum.sh```. The tum files will be stored in package that you assign. Before run ```evo2tum.sh```, please create the blank directories in your ```TUM_PATH```. Ex: eee_01, eee_02 ...

```
    VIRAL_RESULT_PATH: your relative path of VIRAL dataset
    TUM_PATH: the path where your tum files will be stored
    RESULT_NAME: the tum file name that you want to assign

    If the topic you record is /depth_map/livins_odometry,
    MAIN_TOPIC: /depth_map
    SUB_TOPIC: livins_odometry
```

*Note*
The ground truth topic is also assign  for ```MAIN_TOPIC``` and ```SUB_TOPIC```

- 3. Run ```evo_arpe.sh```. Evaluate Absolute Pose Error or Relative Pose Error.

```
    NAME_list: the name of the tum file that you want to evaluate
    GROUND_TRUTH:  the tum file name of ground truth 
```

*Note*
The directories of evaluation result need to be created. Ex: APE_results, RPE_results, APE_position_results, RPE_position_results ...

- 4. If you want to show the trajectory, please run ```evaluate_traj.sh```

```
    TUM_PATH: the path where your tum files will be stored
    NAME_list: the results that you want to demonstrate 
    GROUND_TRUTH:  the tum file name of ground truth
```

*Note*
Need to choose the params ex: ```VIR_EEE```, ```VIR_NYA```, ```VIR_SBS```
