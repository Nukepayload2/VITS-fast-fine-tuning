# ��Σ�ʹ�� Docker ����ѵ��������ѵ��
## �������Э��
�˽̳̼��丽���� docker ��������ļ�������ѧϰ����ʹ�ã�����δ��������Դ����Ȩ���ɴ��������Դ�����������������������º����´�������Щ��������ͽ̵̳������Լ� VITS �����޹ء�

�������ʹ�ô˽̳̼��丽���� docker ��������ļ����������ͬ�����Э�顣

## ϵͳҪ��
- Docker (17+)
- NVIDIA GPU
- CUDA �汾���� 11.7������װ���µ� CUDA SDK
- ���ڷ��� Docker Hub �� nvidia/cuda ����Ļ���������
- ���� Windows Docker, ��Ҫ���� WSL2 ģʽ

## 1. ׼��ģ�ͺ͸������ݣ��� CJE Ϊ��
```console
wget https://huggingface.co/datasets/Plachta/sampled_audio4ft/resolve/main/sampled_audio4ft_v2.zip
unzip sampled_audio4ft_v2.zip

wget https://huggingface.co/spaces/Plachta/VITS-Umamusume-voice-synthesizer/resolve/main/pretrained_models/D_trilingual.pth -O ./pretrained_models/D_0.pth
wget https://huggingface.co/spaces/Plachta/VITS-Umamusume-voice-synthesizer/resolve/main/pretrained_models/G_trilingual.pth -O ./pretrained_models/G_0.pth
wget https://huggingface.co/spaces/Plachta/VITS-Umamusume-voice-synthesizer/resolve/main/configs/uma_trilingual.json -O ./configs/finetune_speaker.json
```

## 2. ׼��ѵ������
�� `DATA.MD`��

`raw_audio` �� `Rename.ps1` ��������������ǰ�ļ��е� wav �ļ�����Ҫ�ȱ༭���еĽ�ɫ�� (ռλ��Ϊ `YourName`) �����С�

## 3. ʹ�� dockerfile ����ѵ���õľ�������
- ���ɾ��� `docker build -t vits_fast_fine_tuning:latest .`
- ���ݾ�������޸� `preproc-train.sh`
- ʹ�� `docker-compose up` ��������
