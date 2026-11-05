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

- **PRL**：支持 PPS 和 PPLNS 两种结算方式，默认采用 PPS。
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
wget -c https://github.com/pearlfortune/pearl-miner/releases/download/v2.3.8/pearlfortune-v2.3.8.tar.gz \
&& tar vxzf pearlfortune-v2.3.8.tar.gz \
&& cd pearlfortune
```

根据驱动支持的 CUDA 版本，选择对应命令运行：

**CUDA 12**

```sh
./miner-cuda12 \
--proxy global.pearlfortune.org:443 \
--address YOUR_PRL_ADDRESS \
--worker $(hostname)
```

**CUDA 13**

```sh
./miner-cuda13 \
--proxy global.pearlfortune.org:443 \
--address YOUR_PRL_ADDRESS \
--worker $(hostname)
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
                "install_url": "https://github.com/pearlfortune/pearl-miner/releases/download/v2.3.8/pearlfortune-v2.3.8.tar.gz",
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
    pearlfortune/pearl-miner:v2.3.8 \
    --proxy global.pearlfortune.org:443 \
    --address YOUR_PRL_ADDRESS \
    --worker "$(hostname)"

## Logs
docker logs -f pearl-miner
```

### Windows

1. 下载并解压 `miner-windows-v2.x.x.zip`。
2. 右键单击 `start-miner.bat`，选择“编辑”，然后设置：
   - `WALLET`：你的 PRL 收益地址
   - `WORKER`：这台矿机的名称，例如 `rig01`
   - `PROXY`：使用 `global.pearlfortune.org:443` 或 `jp.pearlfortune.org:443`
3. 双击 `start-miner.bat` 启动。

矿工退出后，启动脚本会在 5 秒后自动重启。要停止挖矿，请关闭窗口或按 `Ctrl+C`。

```bat
REM Manual / advanced run
miner.exe --proxy global.pearlfortune.org:443 --address YOUR_PRL_ADDRESS --worker workername
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



### OneZeroMiner

https://github.com/OneZeroMiner/onezerominer/releases

> 如果您在 30xx、40xx 或 50xx 系列显卡上进行了延迟超频，请务必手动选择内核 2。
>
> `--kernel 2`
>
> 可以增加以下参数，防止 15 分钟没有提交就重连矿池的问题
> `--max-no-acc 60`

**Linux**

```sh
wget https://github.com/OneZeroMiner/onezerominer/releases/download/v1.8.0/onezerominer-1.8.0.tar.gz
tar xzf onezerominer-1.8.0.tar.gz && cd onezerominer
./onezerominer --algo=pearl --wallet=YOUR_PRL_ADDRESS --pool=global.pearlfortune.org:8888  --worker $(hostname)
```

**Windows**

```sh
onezerominer.exe --algo=pearl --wallet=YOUR_PRL_ADDRESS --pool=global.pearlfortune.org:8888
```

**HiveOS**

```json
{
  "name": "PF_Pearl_OneZeroMiner",
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
      "miner_alt": "onezerominer",
      "miner_config": {
        "url": "global.pearlfortune.org:8888",
        "algo": "pearl",
        "pass": "x",
        "miner": "onezerominer",
        "template": "%WAL%",
        "install_url": "https://github.com/OneZeroMiner/onezerominer/releases/download/v1.8.0/onezerominer-1.8.0.tar.gz",
        "user_config": "--worker %WORKER_NAME%"
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
| ------------------ | ----------: | ------: |
| RTX 5090           | 436.78 TH/s | 507.2 W |
| RTX 5090 D v2      | 312.32 TH/s | 573.3 W |
| RTX 5090 D         | 288.07 TH/s | 379.1 W |
| RTX 5080           | 246.76 TH/s | 270.6 W |
| RTX 5070 Ti        | 205.83 TH/s | 242.7 W |
| RTX 5070           | 144.46 TH/s | 200.2 W |
| RTX 5070 Laptop    |  93.10 TH/s |  95.6 W |
| RTX 5060 Ti        | 111.51 TH/s | 144.6 W |
| RTX 5060           |  87.70 TH/s | 101.0 W |
| RTX 5050           |  60.40 TH/s |  72.5 W |
| RTX 5070 Ti Laptop | 115.41 TH/s | 138.2 W |
| RTX 5090 Laptop    | 162.37 TH/s | 148.8 W |

### NVIDIA RTX 40 系列

| 显卡 | 算力 | 功耗 |
| ----------------- | ----------: | ------: |
| RTX 4090          | 348.36 TH/s | 438.1 W |
| RTX 4090 D        | 325.89 TH/s | 424.0 W |
| RTX 4090 Laptop   | 181.58 TH/s |  76.9 W |
| RTX 4080 SUPER    | 219.43 TH/s | 266.9 W |
| RTX 4080          | 222.73 TH/s | 305.9 W |
| RTX 4080 Laptop   | 146.90 TH/s |  91.1 W |
| RTX 4070 Ti SUPER | 188.21 TH/s | 225.2 W |
| RTX 4070 Ti       | 170.37 TH/s | 205.7 W |
| RTX 4070 SUPER    | 155.51 TH/s | 184.9 W |
| RTX 4070          | 125.24 TH/s | 126.5 W |
| RTX 4070 Laptop   |  88.15 TH/s |  92.5 W |
| RTX 4060 Ti       |  91.63 TH/s | 107.5 W |
| RTX 4060          |  64.44 TH/s |       — |
| RTX 4060 Laptop   |  61.35 TH/s |  95.2 W |

### NVIDIA RTX 30 系列

| 显卡 | 算力 | 功耗 |
| ------------------ | ----------: | ------: |
| RTX 3090           | 141.09 TH/s | 333.1 W |
| RTX 3080 Ti        | 144.52 TH/s | 277.5 W |
| RTX 3080           | 124.78 TH/s | 259.5 W |
| RTX 3080 Laptop    |  77.19 TH/s |  74.5 W |
| RTX 3070 Ti        |  90.45 TH/s | 194.4 W |
| RTX 3070 Ti Laptop |  76.89 TH/s |  87.6 W |
| RTX 3070           |  82.56 TH/s | 157.6 W |
| RTX 3070 Laptop    |  65.92 TH/s |  84.7 W |
| RTX 3060 Ti        |  67.73 TH/s | 133.9 W |
| RTX 3060           |  53.51 TH/s | 163.1 W |
| RTX 3060 Laptop    |  53.16 TH/s |  62.8 W |
| RTX 3050           |  42.43 TH/s | 129.8 W |
| RTX 3080 Ti Laptop | 100.16 TH/s | 149.6 W |
| RTX 3090 Ti        | 143.63 TH/s | 288.2 W |

### NVIDIA RTX 20 系列

| 显卡 | 算力 | 功耗 |
| -------------------------- | ----------: | ------: |
| RTX 2080 Ti                | 110.01 TH/s | 240.4 W |
| RTX 2080                   |  81.77 TH/s | 186.1 W |
| RTX 2070 SUPER             |  73.27 TH/s | 200.3 W |
| RTX 2070                   |  60.28 TH/s | 162.0 W |
| RTX 2070 with Max-Q Design |  43.83 TH/s |  90.4 W |
| RTX 2060 SUPER             |  52.54 TH/s | 109.5 W |
| RTX 2060                   |  48.75 TH/s | 129.5 W |
| RTX 2080 SUPER             |  89.59 TH/s | 209.9 W |

### NVIDIA 数据中心与工作站显卡

| 显卡 | 算力 | 功耗 |
| ------------------------------------------ | -----------: | -------: |
| H100 80GB HBM3                             |  820.78 TH/s |  698.4 W |
| Tesla T4                                   |   36.43 TH/s |   67.9 W |
| NVIDIA CMP 90HX                            |   94.08 TH/s |  245.4 W |
| NVIDIA CMP 170HX                           |  179.94 TH/s |  189.9 W |
| A100-PCIE-40GB                             |  231.27 TH/s |  248.5 W |
| A100-SXM4-80GB                             |  282.42 TH/s |  398.3 W |
| RTX A4000                                  |   67.74 TH/s |  139.7 W |
| NVIDIA CMP 50HX                            |   91.80 TH/s |  161.5 W |
| NVIDIA CMP 40HX                            |   55.72 TH/s |  133.3 W |
| RTX PRO 5000 72GB Blackwell                |  306.22 TH/s |  350.0 W |
| Tesla T10                                  |   76.45 TH/s |  146.2 W |
| A10                                        |   94.67 TH/s |  149.5 W |
| A100-SXM4-40GB                             |  247.96 TH/s |        — |
| A30                                        |  117.13 TH/s |  164.8 W |
| B200                                       | 1454.43 TH/s |  981.6 W |
| B300 SXM6 AC                               |  856.46 TH/s | 1085.8 W |
| H100 NVL                                   |  580.40 TH/s |  396.9 W |
| H100 PCIe                                  |  503.77 TH/s |        — |
| H200                                       |  806.99 TH/s |  691.7 W |
| H800 PCIe                                  |  521.19 TH/s |  346.2 W |
| L40S                                       |  320.52 TH/s |  349.8 W |
| NVIDIA CMP 70HX                            |   48.75 TH/s |  115.9 W |
| Quadro RTX 5000                            |   59.14 TH/s |   61.1 W |
| RTX 6000 Ada Generation                    |  282.02 TH/s |        — |
| RTX A2000                                  |   43.62 TH/s |   69.2 W |
| RTX A2000 12GB                             |   41.97 TH/s |   69.2 W |
| RTX PRO 6000 Blackwell Server Edition      |  463.68 TH/s |  552.4 W |
| RTX PRO 6000 Blackwell Workstation Edition |  453.30 TH/s |  500.0 W |
| Tesla V100-SXM2-16GB                       |   19.86 TH/s |  292.4 W |
| Tesla V100-SXM2-32GB                       |   50.18 TH/s |        —
