# ��Σ�ʹ�� Docker ����ѵ��������ѵ��
## �̳���ɶȺ�Ŀ��
- [x] ���� docker ���� (��Ҫ����)
- [x] ������������������Ԥ�����ѵ��
- [ ] ������������������Ԥ�����ѵ��

## �������Э��
�˽̳̼��丽���� docker ��������ļ�������ѧϰ����ʹ�ã�����δ��������Դ����Ȩ���ɴ��������Դ�����������������������º����´�������Щ��������ͽ̵̳������Լ� VITS �����޹ء�

�������ʹ�ô˽̳̼��丽���� docker ��������ļ����������ͬ�����Э�顣

## ϵͳҪ��
### ���Ҫ��
#### ���
- Docker Engine 17+
- CUDA �汾���� 11.8������װ���µ� CUDA SDK
- ���� Windows Docker, ��Ҫ���� WSL2 ģʽ
#### Ӳ��
- NVIDIA GPU, Ĭ������Ҫ�� VRAM ���� 14 GB
#### ����
- �������� `nvidia/cuda` Docker ����������Ļ���������

### ���ļ����ߵ����� (�����ο�)
#### ���
- Windows 11 x64 22H2
- WSL2 �ں˰汾
- Docker Engine v24.0.2
- CUDA 12.2
#### Ӳ��
- RTX 4090
- 64 GB RAM
- Intel Core i5 13600KF

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

### ���� pyopenjtalk ���������
https://downloads.sourceforge.net/open-jtalk/open_jtalk_dic_utf_8-1.11.tar.gz

��ѹ�� `jtalk_dict`

### ���� hybrid_transformer
```console
wget https://dl.fbaipublicfiles.com/demucs/hybrid_transformer/955717e8-8726e21a.th -O ./hybrid_transformer/955717e8-8726e21a.th
```

## 2. ׼��ѵ������
�� `DATA.MD` ��Ҫ��׼�����ݡ�

`raw_audio` �� `Rename.ps1` ��������������ǰ�ļ��е� wav �ļ�����Ҫ�ȱ༭���еĽ�ɫ�� (ռλ��Ϊ `YourName`) �����С�

��ʼ��һ��֮ǰ��Ҫɾ�� `raw_audio` �е������ļ����Լ����� `.gitkeep` �ļ���Ҫ�һ���Щɾ�����ļ����������ص��޸ģ����Խ��ֿ�ָ�����ʼ״̬ (`git reset --hard HEAD`)��

## 3. ʹ�� dockerfile ����ѵ���õľ�������
- ���ɾ��� `docker build -t vits_fast_fine_tuning:latest .`
- ���ݾ�������޸� `preproc-train.sh`
- ʹ�� `docker-compose up` �������������Ҫ�����ϴε�ѵ������Ҫ���� `--no-recreate` ����������Ԥ�������ݻᶪʧ�����¼���ѵ��֮ǰ��Ҫ����ͬ�����ݽ���Ԥ����
- �����ڵ� Tensorboard ������[������ϵͳ���Է���](http://localhost:6006)
