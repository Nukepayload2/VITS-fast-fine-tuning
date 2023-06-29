#!/bin/bash
# Procell all audio data
python3 scripts/video2audio.py
python3 scripts/denoise_audio.py
python3 scripts/long_audio_transcribe.py --languages "CJE" --whisper_size large
python3 scripts/short_audio_transcribe.py --languages "CJE" --whisper_size large
python3 scripts/resample.py

# Process all text data
export OPEN_JTALK_DICT_DIR=/app/jtalk_dict
python3 preprocess_v2.py --add_auxiliary_data True --languages "CJE"

# Tensorboard
nohup tensorboard --bind_all --port 6006 --logdir=./OUTPUT_MODEL &

# Start training (comment if you need to continue)
python3 finetune_speaker_v2.py -m ./OUTPUT_MODEL --max_epochs "100" --drop_speaker_embed True

# Continue training (comment if you need to start new training)
#python3 finetune_speaker_v2.py -m ./OUTPUT_MODEL --max_epochs "100" --drop_speaker_embed False --cont True

# Publish artifacts
python3 rearrange_speaker.py
mkdir OUTPUT_MODEL
cp finetune_speaker.json OUTPUT_MODEL
cp G_latest.pth OUTPUT_MODEL
cp moegoe_config.json OUTPUT_MODEL
