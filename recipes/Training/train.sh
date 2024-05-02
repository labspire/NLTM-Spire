tags='mt'
gpu=0
. parse_options.sh 
export CUDA_VISIBLE_DEVICES=$gpu
conf_name=indic

for tag in $tags; do
fairseq-hydra-train --config-dir /path/to/config_dir \
--config-name $conf_name \
task.data=/path/to/data_dir/${tag} \
checkpoint.save_dir=${conf_name}_$tag \

done
