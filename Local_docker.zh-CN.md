# ��Σ�ʹ�� Docker ����ѵ��������ѵ��
## �������Э��
�˽̳̼��丽���� docker ��������ļ�������ѧϰ����ʹ�ã�����δ��������Դ����Ȩ���ɴ��������Դ�����������������������º����´�������Щ��������ͽ̵̳������Լ� VITS �����޹ء�

�������ʹ�ô˽̳̼��丽���� docker ��������ļ����������ͬ�����Э�顣

## ϵͳҪ��
- Docker (17+)
- NVIDIA GPU
- CUDA �汾���� 11.8������װ���µ� CUDA SDK
- ���ڷ��� Docker Hub �� nvidia/cuda ����Ļ���������
- ���� Windows Docker, ��Ҫ���� WSL2 ģʽ

## 1. ׼��ģ�ͺ͸������ݣ��� CJE Ϊ��

### ���ز���ѹ��������
```console
wget https://huggingface.co/datasets/Plachta/sampled_audio4ft/resolve/main/sampled_audio4ft_v2.zip
unzip sampled_audio4ft_v2.zip
```

### ���� VITS ��ģ
```console
wget https://huggingface.co/spaces/Plachta/VITS-Umamusume-voice-synthesizer/resolve/main/pretrained_models/D_trilingual.pth -O ./pretrained_models/D_0.pth
wget https://huggingface.co/spaces/Plachta/VITS-Umamusume-voice-synthesizer/resolve/main/pretrained_models/G_trilingual.pth -O ./pretrained_models/G_0.pth
wget https://huggingface.co/spaces/Plachta/VITS-Umamusume-voice-synthesizer/resolve/main/configs/uma_trilingual.json -O ./configs/finetune_speaker.json
```

### ���� whisper large ģ��
�� [ģ�������б�](https://github.com/openai/whisper/blob/main/whisper/__init__.py) �ҳ� _MODELS �� large ģ�͵����ص�ַ�����ص� `whisper_models` �ļ��С�

���磺
```console
wget https://openaipublic.azureedge.net/main/whisper/models/81f7c96c852ee8fc832187b0132e569d6c3065a3252ed18e56effd0b6a73e524/large-v2.pt -O ./whisper_models/large-v2.pt
```

## 2. ׼��ѵ������
�� `DATA.MD` ��Ҫ��׼�����ݡ�

`raw_audio` �� `Rename.ps1` ��������������ǰ�ļ��е� wav �ļ�����Ҫ�ȱ༭���еĽ�ɫ�� (ռλ��Ϊ `YourName`) �����С�

��ʼ��һ��֮ǰ��Ҫɾ�� `raw_audio` �е������ļ����Լ����� `.gitkeep` �ļ���Ҫ�һ���Щɾ�����ļ������Խ��ֿ�ָ�����ʼ״̬ (`git reset --hard HEAD`)��

## 3. ʹ�� dockerfile ����ѵ���õľ�������
- ���ɾ��� `docker build -t vits_fast_fine_tuning:latest .`
- ���ݾ�������޸� `preproc-train.sh`
- ʹ�� `docker-compose up` ��������
