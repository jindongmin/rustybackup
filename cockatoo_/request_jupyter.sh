job_no=`sbatch -p gpu --gpus=p100-16gb:1 --constraint=p100 -t 4:00:00 --wrap "jupyter notebook --no-browser --port=7775" | cut -d ' ' -f4`
echo $job_no
sleep 30
echo `squeue -u djin | grep "${job_no}"`
slurm_node=`squeue -u djin | grep "${job_no}" | awk '{print $8}'`
echo $slurm_node
nohup ssh -f -N -L 7775:localhost:7775 ${slurm_node} &
