# Procell all audio data
python3 scripts/video2audio.py
python3 scripts/denoise_audio.py
python3 scripts/long_audio_transcribe.py --languages "CJE" --whisper_size large
python3 scripts/short_audio_transcribe.py --languages "CJE" --whisper_size large
python3 scripts/resample.py

# Process all text data
python3 preprocess_v2.py --add_auxiliary_data True --languages "CJE"

# Tensorboard
nohup tensorboard --logdir=./OUTPUT_MODEL &

# Start Training
# Continue: --cont True
python3 finetune_speaker_v2.py -m ./OUTPUT_MODEL --max_epochs "100" --drop_speaker_embed True
