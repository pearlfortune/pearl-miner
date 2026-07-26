# pearl-miner

Website: https://pearlfortune.org/

Discord: https://discord.gg/aDJwPb3rW

Github: https://github.com/pearlfortune/pearl-miner

Docker Hub: https://hub.docker.com/r/pearlfortune/pearl-miner


Pearl Fortune Pool has completed its Global Acceleration and Anti-DDoS access upgrade.

**Recommended connection endpoints:**

Global Accelerated Endpoint: `global.pearlfortune.org:443`

Japan Direct Endpoint: `jp.pearlfortune.org:443`

With this upgrade, miners from different regions around the world can enjoy a more stable connection experience, while the pool now benefits from enhanced protection against network attacks.

We recommend that all miners use: `global.pearlfortune.org:443`

Miners in Japan and East Asia may also test: `jp.pearlfortune.org:443`



## Measured GPU Performance


Methodology: hashrate is the measured single-GPU P90 hashrate from live telemetry, and power is the average power near the P90 hashrate sample window. Snapshot time: 2026-06-27 00:51:48 JST.

### NVIDIA RTX 50 Series

| GPU | Hashrate | Power |
|---|---:|---:|
| RTX 5090 | 359.17 TH/s | 581.2 W |
| RTX 5090 D v2 | 282.21 TH/s | 572.8 W |
| RTX 5090 D | 278.54 TH/s | 444.8 W |
| RTX 5080 | 210.64 TH/s | 349.3 W |
| RTX 5070 Ti | 178.19 TH/s | 266.9 W |
| RTX 5070 | 126.75 TH/s | 228.5 W |
| RTX 5060 Ti | 93.92 TH/s | 155.4 W |
| RTX 5060 | 74.68 TH/s | 112.7 W |

### NVIDIA RTX 40 Series

| GPU | Hashrate | Power |
|---|---:|---:|
| RTX 4090 | 288.21 TH/s | 447.3 W |
| RTX 4090 D | 260.39 TH/s | 409.1 W |
| RTX 4080 SUPER | 190.95 TH/s | 313.9 W |
| RTX 4070 Ti SUPER | 158.65 TH/s | 259.4 W |
| RTX 4070 Ti | 144.71 TH/s | 234.1 W |
| RTX 4070 SUPER | 133.92 TH/s | 216.9 W |
| RTX 4070 | 111.50 TH/s | 193.4 W |
| RTX 4060 Ti | 79.14 TH/s | 128.8 W |

### NVIDIA RTX 30 Series

| GPU | Hashrate | Power |
|---|---:|---:|
| RTX 3090 | 119.67 TH/s | 354.4 W |
| RTX 3080 Ti | 117.82 TH/s | 348.5 W |
| RTX 3080 | 107.61 TH/s | 285.3 W |
| RTX 3080 Laptop | 64.40 TH/s | 86.3 W |
| RTX 3070 Ti Laptop | 59.47 TH/s | 96.3 W |
| RTX 3070 Laptop | 55.75 TH/s | 92.8 W |
| RTX 3070 | 70.28 TH/s | 176.5 W |
| RTX 3060 Ti | 57.44 TH/s | 159.9 W |
| RTX 3060 | 45.77 TH/s | 167.7 W |

### NVIDIA Data Center and Workstation

| GPU | Hashrate | Power |
|---|---:|---:|
| RTX PRO 6000 Blackwell | 329.85 TH/s | 476.7 W |
| NVIDIA L40S | 223.75 TH/s | 349.9 W |
| A100-SXM4-80GB | 240.38 TH/s | 392.7 W |
| A100-PCIE-40GB | 197.16 TH/s | 247.2 W |
| NVIDIA L20 | 101.02 TH/s | 312.2 W |
| Tesla V100-SXM2-32GB | 31.08 TH/s | 286.3 W |

### Other GPUs

| GPU | Hashrate | Power |
|---|---:|---:|
| MetaX C500 | 109.34 TH/s | 296.2 W |



## Get Started

#### Servers

```ini
global.pearlfortune.org:443
jp.pearlfortune.org:443
```



#### Linux (NVIDIA)

```sh
## Download
wget -c https://github.com/pearlfortune/pearl-miner/releases/download/v2.0.3/pearlfortune-v2.0.3.tar.gz \
&& tar vxzf pearlfortune-v2.0.3.tar.gz \
&& cd pearlfortune


## Start - CUDA 12
./miner-cuda12 \
--proxy global.pearlfortune.org:443 \
--address {prl-address} \
--worker $(hostname) \
-gpu

## Start - CUDA 13
./miner-cuda13 \
--proxy global.pearlfortune.org:443 \
--address {prl-address} \
--worker $(hostname) \
-gpu
```



#### Linux (AMD)

```sh
## Download
wget -c https://github.com/pearlfortune/pearl-miner/releases/download/v1.2.4/pearlfortune-amd-v1.2.4.tar.gz \
&& tar vxzf pearlfortune-amd-v1.2.4.tar.gz \
&& cd pearlfortune \
&& chmod +x miner

## Start
LD_LIBRARY_PATH=./lib:$LD_LIBRARY_PATH ./miner \
--proxy global.pearlfortune.org:443 \
--address {prl-address} \
--worker $(hostname) \
-gpu
```



#### HiveOS (NVIDIA)

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
                "install_url": "https://github.com/pearlfortune/pearl-miner/releases/download/v2.0.3/pearlfortune-v2.0.3.tar.gz",
                "user_config": ""
            },
            "pool_geo": [

            ]
        }
    ]
}
```


#### HiveOS (AMD)

```json
{
    "name": "pearl - amd",
    "isFavorite": false,
    "items": [
        {
            "coin": "PEARL",
            "pool_ssl": false,
            "dpool_ssl": false,
            "miner": "custom",
            "miner_alt": "pearlfortune-amd",
            "miner_config": {
                "url": "global.pearlfortune.org:443",
                "miner": "pearlfortune-amd",
                "template": "%WAL%",
                "install_url": "https://github.com/pearlfortune/pearl-miner/releases/download/v1.2.4/pearlfortune-amd-v1.2.4.tar.gz"
            },
            "pool_geo": [

            ]
        }
    ]
}
```


#### Docker (NVIDIA)

https://hub.docker.com/r/pearlfortune/pearl-miner 

```shell
## Start
docker run -d \
    --name pearl-miner \
    --restart unless-stopped \
    --gpus all \
    pearlfortune/pearl-miner:v2.0.3 \
    --proxy global.pearlfortune.org:443 \
    --address {prl-address} \
    --worker "$(hostname)" \
    -gpu

## Logs
docker logs -f pearl-miner
```



#### Windows

1. Download and unzip `miner-windows-v1.2.4.zip`.
2. Right-click `start-miner.bat` → **Edit**, then set:
   - `WALLET` — your PRL payout address
   - `WORKER` — a name for this rig (e.g. `rig01`)
   - `PROXY`  — leave as `global.pearlfortune.org:443` unless told otherwise
3. Double-click `start-miner.bat`.

The launcher restarts the miner automatically 5 seconds after it exits.
Close the window (or press `Ctrl+C`) to stop.

```cmd
## Manual / advanced run
miner.exe --proxy global.pearlfortune.org:443 --address {prl-address} --worker workername -gpu
```

