## Single File Inferencing
Inference script for finetuned Wav2vec2.0 model on single audio file.

## Usage
* append fairseq path to sys.path in the infer.py script or add it to the PYTHONPATH
* update model path in the config.yaml
* update deivce('cpu', 'cuda') in the config.yaml
* run the infer.py script

## Example
```bash
from infer import infer
output = infer(file_pth='test.wav', conf_pth='config.yaml')
```