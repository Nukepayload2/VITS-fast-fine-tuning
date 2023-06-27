# 如何：使用 Docker 创建训练环境并训练
## 附加许可协议
此教程及其附带的 docker 相关配置文件仅用于学习交流使用，产物未经声音来源的授权不可传播。擅自传播产物可能面临严厉的民事和刑事处罚。这些后果与代码和教程的作者以及 VITS 社区无关。

如果继续使用此教程及其附带的 docker 相关配置文件，则代表你同意许可协议。

## 系统要求
- Docker (17+)
- NVIDIA GPU
- CUDA 版本至少 11.8，可以装最新的 CUDA SDK
- 用于访问 Docker Hub 和 nvidia/cuda 镜像的互联网连接
- 对于 Windows Docker, 需要开启 WSL2 模式

## 1. 准备模型和辅助数据，以 CJE 为例

### 下载并解压辅助数据
```console
wget https://huggingface.co/datasets/Plachta/sampled_audio4ft/resolve/main/sampled_audio4ft_v2.zip
unzip sampled_audio4ft_v2.zip
```

### 下载 VITS 底模
```console
wget https://huggingface.co/spaces/Plachta/VITS-Umamusume-voice-synthesizer/resolve/main/pretrained_models/D_trilingual.pth -O ./pretrained_models/D_0.pth
wget https://huggingface.co/spaces/Plachta/VITS-Umamusume-voice-synthesizer/resolve/main/pretrained_models/G_trilingual.pth -O ./pretrained_models/G_0.pth
wget https://huggingface.co/spaces/Plachta/VITS-Umamusume-voice-synthesizer/resolve/main/configs/uma_trilingual.json -O ./configs/finetune_speaker.json
```

### 下载 whisper large 模型
从 [模型下载列表](https://github.com/openai/whisper/blob/main/whisper/__init__.py) 找出 _MODELS 中 large 模型的下载地址，下载到 `whisper_models` 文件夹。

例如：
```console
wget https://openaipublic.azureedge.net/main/whisper/models/81f7c96c852ee8fc832187b0132e569d6c3065a3252ed18e56effd0b6a73e524/large-v2.pt -O ./whisper_models/large-v2.pt
```

## 2. 准备训练数据
按 `DATA.MD` 的要求准备数据。

`raw_audio` 中 `Rename.ps1` 可用于重命名当前文件夹的 wav 文件，需要先编辑其中的角色名 (占位符为 `YourName`) 再运行。

开始下一步之前需要删除 `raw_audio` 中的所有文件，以及所有 `.gitkeep` 文件。要找回这些删除的文件，可以将仓库恢复到初始状态 (`git reset --hard HEAD`)。

## 3. 使用 dockerfile 创建训练用的镜像并启动
- 生成镜像 `docker build -t vits_fast_fine_tuning:latest .`
- 根据具体情况修改 `preproc-train.sh`
- 使用 `docker-compose up` 启动容器
