#!/usr/bin/env bash
set -euxo pipefail

# system dependencies
sudo apt-get update -y
sudo apt-get install -y python3-venv python3-pip git

# create & activate Python venv
python3 -m venv /home/ubuntu/vllm_env
source /home/ubuntu/vllm_env/bin/activate

# install vLLM + HF client
pip install --upgrade pip vllm huggingface_hub

# persist HF token
echo "export HF_TOKEN=${hf_token}" >> /home/ubuntu/.bashrc

# launch vLLM server in background
nohup /home/ubuntu/vllm_env/bin/vllm serve mistralai/Mistral-7B-Instruct-v0.2 \
  --tokenizer_mode mistral \
  --load_format mistral \
  --config_format mistral \
  --port 8000 > /home/ubuntu/vllm.log 2>&1 &
