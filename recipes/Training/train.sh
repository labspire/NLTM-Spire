source /envs/fairseq/bin/activate
tags='mt'
gpu=0
. parse_options.sh 
export CUDA_VISIBLE_DEVICES=$gpu
config_name=indic

for tag in $tags; do
fairseq-hydra-train --config-dir /config \
--config-name $config_name \
task.data=/home1/Amartya/fairseq/data/ltr/processed_nt/$tag \
checkpoint.save_dir=${config_name}_$tag \
checkpoint.reset_optimizer=true 
done
