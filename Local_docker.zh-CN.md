## 1. ׼��ģ�ͺ͸������ݣ��� CJE Ϊ��
```console
wget https://huggingface.co/datasets/Plachta/sampled_audio4ft/resolve/main/sampled_audio4ft_v2.zip
unzip sampled_audio4ft_v2.zip
mkdir video_data
mkdir raw_audio
mkdir denoised_audio
mkdir custom_character_voice
mkdir segmented_character_voice

wget https://huggingface.co/spaces/Plachta/VITS-Umamusume-voice-synthesizer/resolve/main/pretrained_models/D_trilingual.pth -O ./pretrained_models/D_0.pth
wget https://huggingface.co/spaces/Plachta/VITS-Umamusume-voice-synthesizer/resolve/main/pretrained_models/G_trilingual.pth -O ./pretrained_models/G_0.pth
wget https://huggingface.co/spaces/Plachta/VITS-Umamusume-voice-synthesizer/resolve/main/configs/uma_trilingual.json -O ./configs/finetune_speaker.json
```
�ⲿ�����ݿ�����ֻ���ķ�ʽ���أ�Ҳ���Ը��Ƶ��������档

## 2. ׼��ѵ�����ݣ��� DATA.MD
�ⲿ�����ݿ�����ֻ���ķ�ʽ���أ�Ҳ���Ը��Ƶ��������档

## 3. ʹ�� dockerfile ����ѵ���õľ�������
���Ը� `docker-composer.yml` �����������ã�Ҳ�����ֶ�ָ�� docker run �Ĳ��������������á�
���׼�������ݵ�ʱ��ѡ���˹��صķ�ʽ����ô�����ļ����ڴ˲�����ء�
### docker-composer ��ʽ
- �ο� [�����ļ��еĽ̳�](https://docs.docker.com/compose/compose-file/compose-file-v3/#volumes) �༭ `docker-composer.yml` ��ָ��ѵ��������յ��ĸ��ļ���
- ʹ�� `docker-composer up -d` ����

### docker run ��ʽ
- ���ɾ��� `docker build -t vits_fast_fine_tuning:latest .`
- `docker run` �Ĳ������ã�
	- ʹ�� `--gpus all` ���� GPU
	- Ҫ׼��һ�����Ŀ¼������ѵ���������������ʽ��`-mount type=bind,source=���ղ�����ļ���,destination=/app/OUTPUT_MODEL`
