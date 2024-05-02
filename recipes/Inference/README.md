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
```bash
* Update the infer.py script path to the fairseq directory.
* Update the metircs.py script path to the fairseq_preprocessing directory.

subset <train/valid/test>
w2v2_path <path to the finetuned model>
data_dir <path to the data directory>
results <path to the results directory>
dialect_level_ed <True/False> (if True, it will calculate the dialect level wer)
```
* The script will infer on the data and store the `references` and its corresponding `hypothesis`. It also gives the `file level wer`. 

## Example

```bash
./infer.sh --tags 'mt hi en' --gpu 0
```

## References
1. Fairseq [wav2vec 2.0](https://github.com/facebookresearch/fairseq/blob/main/examples/wav2vec/README.md)