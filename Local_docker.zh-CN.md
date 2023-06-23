## 1. ׼��ģ�ͺ͸������ݣ��� CJE Ϊ��
```console
wget https://huggingface.co/datasets/Plachta/sampled_audio4ft/resolve/main/sampled_audio4ft_v2.zip
unzip sampled_audio4ft_v2.zip

wget https://huggingface.co/spaces/Plachta/VITS-Umamusume-voice-synthesizer/resolve/main/pretrained_models/D_trilingual.pth -O ./pretrained_models/D_0.pth
wget https://huggingface.co/spaces/Plachta/VITS-Umamusume-voice-synthesizer/resolve/main/pretrained_models/G_trilingual.pth -O ./pretrained_models/G_0.pth
wget https://huggingface.co/spaces/Plachta/VITS-Umamusume-voice-synthesizer/resolve/main/configs/uma_trilingual.json -O ./configs/finetune_speaker.json
```

## 2. ׼��ѵ������
�� DATA.MD

## 3. ʹ�� dockerfile ����ѵ���õľ�������
���Ը� `docker-composer.yml` �����������ã�Ҳ�����ֶ�ָ�� docker run �Ĳ��������������á�
���׼�������ݵ�ʱ��ѡ���˹��صķ�ʽ����ô�����ļ����ڴ˲�����ء�
- ���ɾ��� `docker build -t vits_fast_fine_tuning:latest .`
### docker-composer ��ʽ
- ʹ�� `docker-composer up -d` ����

### docker run ��ʽ
- `docker run` �Ĳ������ã�
	- ʹ�� `--gpus all` ���� GPU
	- Ҫ׼��һ�����Ŀ¼������ѵ���������������ʽ��`-mount type=bind,source=���ղ�����ļ���,destination=/app/OUTPUT_MODEL`
