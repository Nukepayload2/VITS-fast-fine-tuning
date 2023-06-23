## 1. 准备模型和辅助数据，以 CJE 为例
```console
wget https://huggingface.co/datasets/Plachta/sampled_audio4ft/resolve/main/sampled_audio4ft_v2.zip
unzip sampled_audio4ft_v2.zip

wget https://huggingface.co/spaces/Plachta/VITS-Umamusume-voice-synthesizer/resolve/main/pretrained_models/D_trilingual.pth -O ./pretrained_models/D_0.pth
wget https://huggingface.co/spaces/Plachta/VITS-Umamusume-voice-synthesizer/resolve/main/pretrained_models/G_trilingual.pth -O ./pretrained_models/G_0.pth
wget https://huggingface.co/spaces/Plachta/VITS-Umamusume-voice-synthesizer/resolve/main/configs/uma_trilingual.json -O ./configs/finetune_speaker.json
```

## 2. 准备训练数据
见 DATA.MD

## 3. 使用 dockerfile 创建训练用的镜像并启动
可以改 `docker-composer.yml` 进行启动配置，也可以手动指定 docker run 的参数进行启动配置。
如果准备是数据的时候选择了挂载的方式，那么数据文件夹在此步骤挂载。
- 生成镜像 `docker build -t vits_fast_fine_tuning:latest .`
### docker-composer 方式
- 使用 `docker-composer up -d` 启动

### docker run 方式
- `docker run` 的参数配置：
	- 使用 `--gpus all` 启用 GPU
	- 要准备一个输出目录用来接训练产物。启动参数格式：`-mount type=bind,source=接收产物的文件夹,destination=/app/OUTPUT_MODEL`
