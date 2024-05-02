## Fairseq Inferencing
Inference script for finetuned Wav2vec2.0 model.

## Usage
* Activate the conda environment.
```bash
conda activate env_name
```
* Use the [fairseq_preprocessing](https://github.com/Amartyaveer/NLTM-Spire/blob/main/recipes/fairseq_preprocessing/) scripts to prepare the data.
* Note that the input is expected to be single channel, sampled at 16 kHz
* Things to be updated in the inference script:


* The script will infer on the data and store the `references` and its corresponding `hypothesis`. It also gives the `file level wer`. 

## Example

```bash

```

## References
1. Fairseq [wav2vec 2.0](https://github.com/facebookresearch/fairseq/blob/main/examples/wav2vec/README.md)