## Wav2vec2.0 Finetuning
Finetuning script for Wav2vec2.0 model.

## Usage
* Activate the conda environment.
```bash
conda activate env_name
```
* Use the [fairseq_preprocessing](https://github.com/Amartyaveer/NLTM-Spire/blob/main/recipes/fairseq_preprocessing/) scripts to prepare the data.
* Note that the input is expected to be single channel, sampled at 16 kHz
* Things to be updated in the training script:
```bash
--config-dir <path_to_config_dir>
--config_name <config_name>
--task.data <path_to_data_dir>
```
* Run the training script as follows:
```bash
./train.sh --tags <tags> --gpu <gpu_id>
```
* The script will train the model and save the checkpoints in the `checkpoints` directory named as `./outputs/data/timestamp`.


## Example

```bash
./train.sh --tags 'mt hi en' --gpu 0
```

## References
1. Fairseq [wav2vec 2.0](https://github.com/facebookresearch/fairseq/blob/main/examples/wav2vec/README.md)