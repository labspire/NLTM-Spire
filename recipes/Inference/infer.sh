#!/bin/bash
set -e
source /envs/fairseq/bin/activate
tags='maithili'
gpu=0
. parse_options.sh
export CUDA_VISIBLE_DEVICES=$gpu
hrs=200
mdl=indic
subset="dev"
label="ltr"
dialect_level_ed=True

for tag in $tags; do 
w2v2_pth=/fairseq/Models/finetuned/indic_finetuned/${tag}_checkpoint_best.pt
data_dir="/fairseq/data/processed_${tag}"  
results=/fairseq/results/${tag}/ 

[ -e $results/${tag}/hypo.units-checkpoint_best.pt-test.txt ] && rm $results/${subset}/${tag}/*.txt
[ -e $results/{tag}/hypo.units-checkpoint_best.pt-valid.txt ] && rm $results/${subset}/${tag}/*.txt

python3 /fairseq/examples/speech_recognition/infer.py $data_dir/${tag} \
                --task audio_finetuning \
                --nbest 1 \
                --path $w2v2_pth \
                --gen-subset $subset  \
                --results-path $results/${subset}/${tag} \
                --w2l-decoder viterbi \
                --sil-weight 0 \
                --criterion ctc \
                --labels $label \
                --max-tokens 4000000 \
                --post-process letter \
                --beam 1


python3 /fairseq/fairseq_preprocessing/metrics.py ${results}/${subset}/${tag} $subset viterbi_${tag} $results $tag ${data_dir}/${tag} $dialect_level_ed
done
