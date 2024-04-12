#!/bin/bash
: '
 provide the input train, test, dev folder(wav.scp, text) in kaldi format 
 '
source envs/fairseq/bin/activate
set -e

train=0
dev=0
test=0
tags="mt"

. parse_options.sh

for tag in ${tags}; do

train_folder=/fairseq/data/exp/kaldi/data_${tag}/train_${tag}_300h
dev_folder=/fairseq/data/exp/kaldi/data_${tag}/dev_${tag}_5h
test_folder=/fairseq/data/exp/kaldi/data_${tag}/test_${tag}_5h
output_folder=/fairseq/data/processed_${tag}
pyscript=/fairseq/fairseq_preprocessing/data_prep.py

mkdir -p $output_folder

if [ $train == 1 ]; then
python3 $pyscript \
    --folder  ${train_folder} \
    --save_folder ${output_folder}  \
    --tag train \
    --wav_prep \
    --text_prep \
    --lexicon \
    --save_dict 
fi

if [ $dev == 1 ]; then
python3 $pyscript \
    --folder ${dev_folder} \
    --save_folder ${output_folder} \
    --tag dev \
    --wav_prep \
    --text_prep  \
    # --dialect_prep
fi

if [ $test == 1 ]; then
python3 $pyscript \
    --folder ${test_folder} \
    --save_folder ${output_folder} \
    --tag test \
    --wav_prep \
    --text_prep \
    # --dialect_prep
fi
done