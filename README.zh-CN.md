# Pearl Fortune（PF Pool）挖矿指南

[English](./README.md) | [简体中文](./README.zh-CN.md)

本指南说明如何使用 Pearl Fortune 官方矿工或第三方挖矿软件连接 PF Pool。

- [官方网站](https://pearlfortune.org/)
- [Discord](https://discord.gg/aDJwPb3rW)
- [官方矿工与版本发布](https://github.com/pearlfortune/pearl-miner)
- [官方 Docker 镜像](https://hub.docker.com/r/pearlfortune/pearl-miner)

## 快速开始

1. 准备接收收益的 PRL 公共地址，并确认显卡型号。
2. 选择官方 Pearl Fortune 矿工，或选择支持该显卡的第三方挖矿软件。
3. 按下方对应示例配置，将 `YOUR_PRL_ADDRESS` 替换为你的 PRL 收益地址。
4. 启动后确认矿工持续运行、连接到矿池，并有被接受的份额。

### 矿池连接地址

**官方 Pearl Fortune 矿工**（`pearl-miner`，包括其 HiveOS 和 Docker 版本）：

- 全球：`global.pearlfortune.org:443`
- 日本：`jp.pearlfortune.org:443`

**第三方挖矿软件**（SRBMiner、PeakMiner、ForgeMiner、RGMiner、BzMiner）：

- 全球：`global.pearlfortune.org:8888`
- 日本：`jp.pearlfortune.org:8888`

### 双挖与结算方式

- **PRL + NOCK**：PF Pool 支持双挖，**双挖时只需指定 PRL 收益地址。**
- **PRL**：支持 PPS 和 PPLNS 两种结算方式，默认采用 PPS。
- **NOCK**：仅支持 PPLNS 结算方式。
- **切换 PRL 的 PPS / PPLNS 结算方式**：请联系管理员。

### 连接注意事项

- **SSL 支持**：两个端口都支持 SSL。
- **矿工连接格式**：部分实测命令使用 `stratum+tcp://`，HiveOS 飞行表中的 `pool_ssl` 也设为 `false`。请保持各示例中的协议和 SSL 字段原样；改为 `stratum+ssl://` 或打开 HiveOS 的 SSL 开关，可能导致部分矿工兼容性报错。
- **密码**：矿池密码不是必填项。部分飞行表中的 `"pass": "x"` 属于实测配置示例，并非 PF Pool 的强制要求。
- **地区**：下方示例默认使用全球地址。如需尝试日本地址，请将命令或飞行表中所有 `global.pearlfortune.org` 替换为 `jp.pearlfortune.org`；飞行表中包括 `pool_urls`、`miner_config.url`，以及包含地址时的 `miner_config.user_config`。端口保持不变。
- **钱包**：命令中的 `YOUR_PRL_ADDRESS` 应替换为你的 PRL 公共收益地址。HiveOS JSON 中的 `%WAL%` 和 `%WORKER_NAME%` 由 HiveOS 自动填入，请勿改动。

### 使用 HiveOS 飞行表

1. 在 HiveOS 中创建或选择你的 PRL 钱包。
2. 导入所选矿工对应的 JSON 飞行表，并选择该钱包。
3. 将飞行表应用到矿机，并按下文检查挖矿结果。

下方飞行表已按所列矿工版本在 PF Pool 实测。导入时请保留矿工名称、钱包模板、协议字段和附加参数。

## 官方 Pearl Fortune 矿工

官方矿工示例使用 `443` 端口；也可以尝试 `jp.pearlfortune.org:443`。

### Linux（NVIDIA）

下载并进入解压目录：

```sh
wget -c https://github.com/pearlfortune/pearl-miner/releases/download/v2.2.9/pearlfortune-v2.2.9.tar.gz \
&& tar vxzf pearlfortune-v2.2.9.tar.gz \
&& cd pearlfortune
```

根据驱动支持的 CUDA 版本，选择对应命令运行：

**CUDA 12**

```sh
./miner-cuda12 \
--proxy global.pearlfortune.org:443 \
--address YOUR_PRL_ADDRESS \
--worker $(hostname) \
-gpu
```

**CUDA 13**

```sh
./miner-cuda13 \
--proxy global.pearlfortune.org:443 \
--address YOUR_PRL_ADDRESS \
--worker $(hostname) \
-gpu
```

### HiveOS（NVIDIA）

Pearl Fortune 官方 HiveOS 飞行表会根据当前驱动自动选择 CUDA 程序。按原样导入即可，无需手动指定 `miner-cuda12` 或 `miner-cuda13`。

```json
{
    "name": "pearl",
    "isFavorite": false,
    "items": [
        {
            "coin": "pearl",
            "pool_ssl": false,
            "dpool_ssl": false,
            "miner": "custom",
            "miner_alt": "pearlfortune",
            "miner_config": {
                "url": "global.pearlfortune.org:443",
                "miner": "pearlfortune",
                "template": "%WAL%",
                "install_url": "https://github.com/pearlfortune/pearl-miner/releases/download/v2.2.9/pearlfortune-v2.2.9.tar.gz",
                "user_config": ""
            },
            "pool_geo": [

            ]
        }
    ]
}
```

### Docker（NVIDIA）

[Docker Hub 镜像](https://hub.docker.com/r/pearlfortune/pearl-miner)

```shell
## Start
docker run -d \
    --name pearl-miner \
    --restart unless-stopped \
    --gpus all \
    pearlfortune/pearl-miner:v2.2.9 \
    --proxy global.pearlfortune.org:443 \
    --address YOUR_PRL_ADDRESS \
    --worker "$(hostname)" \
    -gpu

## Logs
docker logs -f pearl-miner
```

### Windows

1. 从[官方 v2.2.9 发布页](https://github.com/pearlfortune/pearl-miner/releases/tag/v2.2.9)下载并解压 `miner-windows-v2.2.9.zip`。
2. 右键单击 `start-miner.bat`，选择“编辑”，然后设置：
   - `WALLET`：你的 PRL 收益地址
   - `WORKER`：这台矿机的名称，例如 `rig01`
   - `PROXY`：使用 `global.pearlfortune.org:443` 或 `jp.pearlfortune.org:443`
3. 双击 `start-miner.bat` 启动。

矿工退出后，启动脚本会在 5 秒后自动重启。要停止挖矿，请关闭窗口或按 `Ctrl+C`。

```bat
REM Manual / advanced run
miner.exe --proxy global.pearlfortune.org:443 --address YOUR_PRL_ADDRESS --worker workername -gpu
```

## 第三方挖矿软件

这些矿工由独立项目开发和维护，连接 PF Pool 时使用 **`8888` 端口**。支持的硬件、矿工开发费和命令参数取决于软件及其版本；飞行表不能让矿工支持其原本不支持的硬件。

下方示例固定了具体版本。更换版本前请查看对应项目的发布页，并保留该矿工示例中的连接格式。

在 Windows 上运行示例命令前，请先从该矿工的发布页下载对应的 Windows 安装包。

若使用日本地址，请将命令或 HiveOS JSON 中的 `global.pearlfortune.org` 全部替换为 `jp.pearlfortune.org`，端口仍使用 `8888`。

### SRBMiner

[SRBMiner 发布页](https://github.com/doktor83/SRBMiner-Multi/releases)

**Linux**

```sh
wget https://github.com/doktor83/SRBMiner-Multi/releases/download/3.7.3/SRBMiner-Multi-3-7-3-Linux.tar.gz
tar xzf SRBMiner-Multi-3-7-3-Linux.tar.gz && cd SRBMiner-Multi-3-7-3
./SRBMiner-MULTI --disable-cpu --algorithm pearlhash --pool global.pearlfortune.org:8888 --wallet YOUR_PRL_ADDRESS
```

**Windows**

```sh
SRBMiner-MULTI.exe --disable-cpu --algorithm pearlhash --pool global.pearlfortune.org:8888 --wallet YOUR_PRL_ADDRESS
```

**HiveOS**

```json
{
  "name": "PF_Pearl_SRB",
  "isFavorite": false,
  "items": [
    {
      "coin": "PRL",
      "pool_ssl": false,
      "pool_urls": [
        "global.pearlfortune.org:8888"
      ],
      "dpool_ssl": false,
      "miner": "custom",
      "miner_alt": "srbminer_custom",
      "miner_config": {
        "url": "global.pearlfortune.org:8888",
        "algo": "pearlhash",
        "pass": "x",
        "miner": "srbminer_custom",
        "template": "%WAL%.%WORKER_NAME%",
        "install_url": "https://github.com/doktor83/SRBMiner-Multi/releases/download/3.7.3/srbminer_custom-3.7.3.tar.gz",
        "user_config": "--algorithm-gpu pearlhash --wallet %WAL%.%WORKER_NAME% --pool global.pearlfortune.org:8888"
      },
      "pool_geo": []
    }
  ]
}
```

### PeakMiner

[PeakMiner 发布页](https://github.com/peakminer/peakminer/releases)

**Linux**

```sh
wget https://github.com/peakminer/peakminer/releases/download/v2.18.0/peakminer-2.18.0.tar.gz
tar xzf peakminer-2.18.0.tar.gz && cd peakminer
./peakminer --coin pearl -o stratum+tcp://global.pearlfortune.org:8888 -u YOUR_PRL_ADDRESS
```

**Windows**

```sh
peakminer.exe --coin pearl -o stratum+tcp://global.pearlfortune.org:8888 -u YOUR_PRL_ADDRESS
```

**HiveOS**

```json
{
  "name": "PF_Pearl_Peak",
  "isFavorite": false,
  "items": [
    {
      "coin": "PRL",
      "pool_ssl": false,
      "pool_urls": [
        "global.pearlfortune.org:8888"
      ],
      "dpool_ssl": false,
      "miner": "custom",
      "miner_alt": "PeakMiner",
      "miner_config": {
        "url": "global.pearlfortune.org:8888",
        "algo": "pearlhash",
        "pass": "x",
        "miner": "peakminer",
        "template": "%WAL%.%WORKER_NAME%",
        "install_url": "https://github.com/peakminer/peakminer/releases/download/v2.18.0/peakminer-2.18.0.tar.gz",
        "user_config": "--coin pearl"
      },
      "pool_geo": []
    }
  ]
}
```

### ForgeMiner

[ForgeMiner 发布页](https://github.com/0xHashRaptor/ForgeMiner/releases)

**Linux**

```sh
wget https://github.com/0xHashRaptor/ForgeMiner/releases/download/v1.8.5/ForgeMiner-1.8.5-linux.tar.gz
tar xzf ForgeMiner-1.8.5-linux.tar.gz
./forge --algorithm pearlhash --pool global.pearlfortune.org:8888 --wallet YOUR_PRL_ADDRESS
```

**Windows**

```sh
forge.exe --algorithm pearlhash --pool global.pearlfortune.org:8888 --wallet YOUR_PRL_ADDRESS
```

**HiveOS**

```json
{
  "name": "PF_Pearl_Forge",
  "isFavorite": false,
  "items": [
    {
      "coin": "PRL",
      "pool_ssl": false,
      "pool_urls": [
        "global.pearlfortune.org:8888"
      ],
      "dpool_ssl": false,
      "miner": "custom",
      "miner_alt": "ForgeMiner",
      "miner_config": {
        "url": "global.pearlfortune.org:8888",
        "algo": "pearlhash",
        "pass": "x",
        "miner": "ForgeMiner",
        "template": "%WAL%.%WORKER_NAME%",
        "install_url": "https://github.com/0xHashRaptor/ForgeMiner/releases/download/v1.8.5/ForgeMiner-1.8.5.tar.gz",
        "user_config": "--algorithm pearlhash"
      },
      "pool_geo": []
    }
  ]
}
```

### RGMiner

[RGMiner 发布页](https://github.com/Printscan/rgminer/releases)

**Linux**

```sh
wget https://github.com/Printscan/rgminer/releases/download/v1.1.2/rgminer-1.1.2
chmod +x rgminer-1.1.2
./rgminer-1.1.2 --algo pearl --stratum global.pearlfortune.org:8888 --wallet YOUR_PRL_ADDRESS
```

如需只使用编号为 0 的显卡，可在命令末尾添加 `-d 0`。

**Windows**

```sh
rgminer.exe --algo pearl --stratum global.pearlfortune.org:8888 --wallet YOUR_PRL_ADDRESS
```

**HiveOS**

```json
{
  "name": "PF_Pearl_RGMiner",
  "isFavorite": false,
  "items": [
    {
      "coin": "PRL",
      "pool_ssl": false,
      "pool_urls": [
        "global.pearlfortune.org:8888"
      ],
      "dpool_ssl": false,
      "miner": "custom",
      "miner_alt": "rgminer-1.1.2",
      "miner_config": {
        "url": "global.pearlfortune.org:8888",
        "algo": "pearlhash",
        "pass": "x",
        "miner": "rgminer-1.1.2",
        "template": "%WAL%.%WORKER_NAME%",
        "install_url": "https://github.com/Printscan/rgminer/releases/download/v1.1.2/rgminer-1.1.2-hiveos.tar.gz",
        "user_config": "--algo pearl"
      },
      "pool_geo": []
    }
  ]
}
```

### BzMiner

[BzMiner 发布页](https://github.com/bzminer/bzminer/releases)

请根据实际硬件调整 `--nvidia`、`--amd` 和 `--intel` 开关。

**Linux**

```sh
wget https://github.com/bzminer/bzminer/releases/download/v100.45/bzminer_v100.45_linux.tar.gz
tar xzf bzminer_v100.45_linux.tar.gz && cd bzminer_v100.45_linux
./bzminer -a pearl -p stratum+tcp://global.pearlfortune.org:8888 -w YOUR_PRL_ADDRESS --nvidia 1 --amd 1 --intel 1 --igpu 0 --cpu 0 --cpu_threads 0 --nc 1
```

**Windows**

```sh
bzminer.exe -a pearl -p stratum+tcp://global.pearlfortune.org:8888 -w YOUR_PRL_ADDRESS --nvidia 1 --amd 1 --intel 1 --igpu 0 --cpu 0 --cpu_threads 0 --nc 1
```

**HiveOS**

```json
{
  "name": "PF_Pearl_Bz",
  "isFavorite": false,
  "items": [
    {
      "coin": "PRL",
      "pool_ssl": false,
      "pool_urls": [
        "global.pearlfortune.org:8888"
      ],
      "dpool_ssl": false,
      "miner": "custom",
      "miner_alt": "bzminer_custom",
      "miner_config": {
        "url": "global.pearlfortune.org:8888",
        "algo": "pearl",
        "pass": "x",
        "miner": "bzminer_custom",
        "template": "%WAL%",
        "install_url": "https://github.com/bzminer/bzminer/releases/download/v100.45/bzminer_custom-v100.45.tar.gz",
        "user_config": "--nvidia 1 --amd 1 --intel 1 --igpu 0 --cpu 0 --cpu_threads 0 --nc 1"
      },
      "pool_geo": []
    }
  ]
}
```

## 检查挖矿结果

启动矿工后，请确认以下三项：

1. 矿工进程持续运行，并识别到你要使用的显卡。
2. 矿工已连接到所选的 PF Pool 地址。
3. 矿工日志中出现已接受的份额（accepted shares）。

下载成功或 HiveOS 导入成功，不代表已经正常挖矿。如果进程启动后立即退出，请先查看日志，并用同一条矿工命令直接运行以定位错误。修改已测试的矿池地址或协议设置之前，先确认矿工支持该显卡。

## 显卡算力参考

下表算力数据基于 v2.2.6 版本的统计结果。

### NVIDIA RTX 50 系列

| 显卡 | 算力 | 功耗 |
| --------------- | ----------: | ------: |
| RTX 5090        | 402.27 TH/s | 573.3 W |
| RTX 5090 D v2   | 285.74 TH/s | 573.6 W |
| RTX 5090 D      | 273.42 TH/s |       — |
| RTX 5080        | 218.03 TH/s | 334.8 W |
| RTX 5070 Ti     | 187.72 TH/s | 253.5 W |
| RTX 5070        | 125.03 TH/s | 186.0 W |
| RTX 5070 Laptop |  90.51 TH/s |       — |
| RTX 5060 Ti     |  96.11 TH/s | 149.8 W |
| RTX 5060        |  77.05 TH/s | 128.0 W |

### NVIDIA RTX 40 系列

| 显卡 | 算力 | 功耗 |
| ----------------- | ----------: | ------: |
| RTX 4090          | 315.67 TH/s | 441.0 W |
| RTX 4090 D        | 284.45 TH/s | 420.9 W |
| RTX 4090 Laptop   | 163.36 TH/s | 109.2 W |
| RTX 4080 SUPER    | 206.49 TH/s | 262.2 W |
| RTX 4080          | 199.05 TH/s | 281.7 W |
| RTX 4080 Laptop   | 128.70 TH/s | 109.0 W |
| RTX 4070 Ti SUPER | 168.87 TH/s | 231.7 W |
| RTX 4070 Ti       | 162.25 TH/s | 237.6 W |
| RTX 4070 SUPER    | 144.77 TH/s | 209.6 W |
| RTX 4070          | 120.39 TH/s | 163.4 W |
| RTX 4070 Laptop   |  80.67 TH/s |  96.7 W |
| RTX 4060 Ti       |  86.32 TH/s | 139.3 W |
| RTX 4060          |  61.54 TH/s |       — |
| RTX 4060 Laptop   |  54.09 TH/s |  71.8 W |

### NVIDIA RTX 30 系列

| 显卡 | 算力 | 功耗 |
| ------------------ | ----------: | ------: |
| RTX 3090           | 119.65 TH/s | 343.1 W |
| RTX 3080 Ti        | 129.68 TH/s | 301.7 W |
| RTX 3080           | 106.73 TH/s | 304.1 W |
| RTX 3080 Laptop    |  70.10 TH/s |  90.6 W |
| RTX 3070 Ti        |  73.50 TH/s | 175.9 W |
| RTX 3070 Ti Laptop |  70.74 TH/s |  75.0 W |
| RTX 3070           |  72.74 TH/s | 162.9 W |
| RTX 3070 Laptop    |  59.55 TH/s |  95.2 W |
| RTX 3060 Ti        |  59.82 TH/s | 145.1 W |
| RTX 3060           |  47.50 TH/s | 115.7 W |
| RTX 3060 Laptop    |  42.08 TH/s |  52.4 W |

### NVIDIA RTX 20 系列

| 显卡 | 算力 | 功耗 |
| -------------------------- | ---------: | ------: |
| RTX 2080 Ti                | 82.08 TH/s | 235.9 W |
| RTX 2080                   | 64.33 TH/s |       — |
| RTX 2070 SUPER             | 61.28 TH/s |       — |
| RTX 2070                   | 48.30 TH/s |       — |
| RTX 2070 with Max-Q Design | 38.68 TH/s |       — |
| RTX 2060 SUPER             | 43.62 TH/s | 123.7 W |
| RTX 2060                   | 33.90 TH/s |  97.5 W |

### NVIDIA 数据中心与工作站显卡

| 显卡 | 算力 | 功耗 |
| --------------------------- | ----------: | ------: |
| H100 80GB HBM3              | 783.10 TH/s | 697.9 W |
| H800                        | 623.91 TH/s |       — |
| Tesla T4                    |  30.91 TH/s |  69.2 W |
| NVIDIA CMP 90HX             |  69.90 TH/s | 248.5 W |
| NVIDIA CMP 170HX            | 142.97 TH/s |       — |
| A100-PCIE-40GB              | 215.81 TH/s | 251.2 W |
| A100-SXM4-80GB              | 211.22 TH/s | 390.3 W |
| RTX A4000                   |  59.15 TH/s | 139.0 W |
| NVIDIA CMP 50HX             |  74.00 TH/s | 133.1 W |
| NVIDIA CMP 40HX             |  41.11 TH/s |       — |
| RTX A5000                   |  86.06 TH/s | 227.4 W |
| RTX PRO 5000 72GB Blackwell | 286.19 TH/s |       — |
| Quadro RTX 6000             |  81.45 TH/s |       — |
| Tesla T10                   |           — | 127.6 W |
