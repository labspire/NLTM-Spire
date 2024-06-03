## Demo
[Automatic Speech Recognition for low-Resource Indic Languages](https://amartyaveer.github.io/ASR-Deploy/)

## Models

The WERs specified are without the use of any language model.

Model | Pre-training data | Fine-tuning data | Model Links | WER (test-RESPIN)
|---|---|---|---|---
[IndicWav2Vec Base](https://indic-asr-public.objectstore.e2enetworks.net/aaai_ckpts/pretrained_models/indicw2v_base_pretrained.pt) | --- | Maithili | [fairseq](https://media.githubusercontent.com/media/Amartyaveer/NLTM-Spire/main/Models/Finetuned/indic_finetuned/mt_checkpoint_best.pt?download=true) | 18.95


* fine-tuning procedures can be found [here](https://github.com/Amartyaveer/NLTM-Spire/tree/main/recipes/Training).
* Inference procedures can be found [here](https://github.com/Amartyaveer/NLTM-Spire/tree/main/recipes/Inference).
* Single file inference procedures can be found [here](https://github.com/Amartyaveer/NLTM-Spire/tree/main/recipes/Single_File_Infer)

## Directory Structure
```
NLTM-SPIRE
├── configs
│   ├── indic.yaml
│   └── spring.yaml
├── data
│   ├── examples
│   └── mt
├── models
│   ├── finetuned
│   │   └── indic_finetuned
│   └── pretrained
├── recipes
│   ├── Training
│   │   └── train.sh
│   ├── Inference
│   │   └── infer.sh
│   ├── Single_File_infer
│   │   ├── infer.py
│   │   └── config.yaml
│   └── fairseq_preprocessing
│       ├── data_prep.py
│       ├── metrics.py
│       └── run_data_prep.sh
├── requirements.txt
└── README.md
```

## Requirements and Installation
* Create a new conda environment:
```bash
conda create -n env_name python=3.8
conda activate env_name
```
* Python version >= 3.8
* [PyTorch](https://pytorch.org/) version >= 2.0.0
* Fairseq version >= 0.12.2
* CUDA >= 11.8
* For training new models, you'll also need an NVIDIA GPU and NCCL
* To install requirements:

```bash
pip install -r requirements.txt
```
* To install fairseq and develop locally:

``` bash
git clone https://github.com/pytorch/fairseq
cd fairseq
pip install --editable ./
```
* For faster training install NVIDIA's apex library:
```bash
git clone https://github.com/NVIDIA/apex
cd apex
pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" \
  --global-option="--deprecated_fused_adam" --global-option="--xentropy" \
  --global-option="--fast_multihead_attn" ./
```
* Flashlight version >= 0.0.7
* To install [flashlight-text](https://github.com/flashlight/text) and [flashlight-sequence](https://github.com/flashlight/sequence)
```bash
pip install flashlight-text

git clone https://github.com/flashlight/sequence && cd sequence
pip install .
```
* To install parse_options:
```bash
wget https://raw.githubusercontent.com/kaldi-asr/kaldi/master/egs/wsj/s5/utils/parse_options.sh && sudo mv parse_options.sh /usr/local/bin/
```

## Reference Code
1. Facebook AI Research Sequence-to-Sequence Toolkit written in Python. [fairseq](https://github.com/facebookresearch/fairseq)
2. AI4Bharat [IndicWav2Vec](https://ai4bharat.iitm.ac.in/indicwav2vec/)



