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

Methodology: hashrate is the measured single-GPU P90 hashrate from live telemetry, and power is the average power near the P90 hashrate sample window. Snapshot time: 2026-08-01 22:16:16 JST.

### NVIDIA RTX 50 Series

| GPU | Hashrate | Power |
|---|---:|---:|
| RTX 5090 | 497.31 TH/s | 573.3 W |
| RTX 5090 D v2 | 429.46 TH/s | 573.6 W |
| RTX 5080 | 270.26 TH/s | 334.8 W |
| RTX 5070 Ti | 234.26 TH/s | 253.5 W |
| RTX 5070 | 155.79 TH/s | 186.0 W |
| RTX 5060 Ti | 122.44 TH/s | 149.8 W |
| RTX 5060 | 100.47 TH/s | 128.0 W |

### NVIDIA RTX 40 Series

| GPU | Hashrate | Power |
|---|---:|---:|
| RTX 4090 | 369.24 TH/s | 441.0 W |
| RTX 4090 D | 327.52 TH/s | 420.9 W |
| RTX 4090 Laptop | 211.76 TH/s | 109.2 W |
| RTX 4080 SUPER | 236.76 TH/s | 262.2 W |
| RTX 4080 | 239.81 TH/s | 281.7 W |
| RTX 4080 Laptop | 172.31 TH/s | 109.0 W |
| RTX 4070 Ti SUPER | 192.57 TH/s | 231.7 W |
| RTX 4070 Ti | 195.03 TH/s | 237.6 W |
| RTX 4070 SUPER | 160.61 TH/s | 209.6 W |
| RTX 4070 | 125.92 TH/s | 163.4 W |
| RTX 4070 Laptop | 100.36 TH/s | 96.7 W |
| RTX 4060 Ti | 101.51 TH/s | 139.3 W |
| RTX 4060 Laptop | 68.84 TH/s | 71.8 W |
| RTX 4050 Laptop | 55.82 TH/s | 87.3 W |

### NVIDIA RTX 30 Series

| GPU | Hashrate | Power |
|---|---:|---:|
| RTX 3090 | 159.69 TH/s | 343.1 W |
| RTX 3080 Ti | 158.93 TH/s | 301.7 W |
| RTX 3080 | 136.03 TH/s | 304.1 W |
| RTX 3080 Laptop | 85.27 TH/s | 90.6 W |
| RTX 3070 Ti | 92.24 TH/s | 175.9 W |
| RTX 3070 Ti Laptop | 81.18 TH/s | 75.0 W |
| RTX 3070 | 91.89 TH/s | 162.9 W |
| RTX 3070 Laptop | 73.26 TH/s | 95.2 W |
| RTX 3060 Ti | 74.88 TH/s | 145.1 W |
| RTX 3060 | 56.32 TH/s | 115.7 W |
| RTX 3060 Laptop | 56.25 TH/s | 52.4 W |
| RTX 3050 Ti Laptop | 30.48 TH/s | 63.5 W |
| RTX 3050 | 35.47 TH/s | 76.4 W |
| RTX 3050 Laptop | 22.30 TH/s | 43.8 W |

### NVIDIA RTX 20 Series

| GPU | Hashrate | Power |
|---|---:|---:|
| RTX 2080 Ti | 70.93 TH/s | 235.9 W |
| RTX 2060 SUPER | 37.23 TH/s | 123.7 W |
| RTX 2060 | 31.62 TH/s | 97.5 W |

### NVIDIA Data Center and Workstation

| GPU | Hashrate | Power |
|---|---:|---:|
| H100 80GB HBM3 | 742.91 TH/s | 697.9 W |
| A100-SXM4-40GB | 260.04 TH/s | 398.6 W |
| H200 | 720.43 TH/s | 691.4 W |
| Tesla T4 | 23.90 TH/s | 69.2 W |
| NVIDIA L4 | 75.39 TH/s | 71.9 W |
| NVIDIA L40S | 248.68 TH/s | 350.3 W |
| Tesla V100-SXM2-32GB | 52.15 TH/s | 289.4 W |
| B200 | 1055.51 TH/s | 979.2 W |
| NVIDIA CMP 90HX | 85.72 TH/s | 248.5 W |
| A100-PCIE-40GB | 212.12 TH/s | 251.2 W |
| RTX PRO 4500 Blackwell | 142.62 TH/s | 165.1 W |
| A100-SXM4-80GB | 255.90 TH/s | 390.3 W |
| A800-SXM4-80GB | 264.97 TH/s | 400.5 W |
| RTX A4000 | 78.47 TH/s | 139.0 W |
| NVIDIA CMP 50HX | 45.17 TH/s | 133.1 W |
| RTX A5000 | 112.77 TH/s | 227.4 W |
| Tesla T10 | 50.13 TH/s | 127.6 W |

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
wget -c https://github.com/pearlfortune/pearl-miner/releases/download/v2.1.5/pearlfortune-v2.1.5.tar.gz \
&& tar vxzf pearlfortune-v2.1.5.tar.gz \
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
                "install_url": "https://github.com/pearlfortune/pearl-miner/releases/download/v2.1.5/pearlfortune-v2.1.5.tar.gz",
                "user_config": ""
            },
            "pool_geo": [

            ]
        }
    ]
}
```


#### HiveOS (NVIDIA) - https://pool.kryptex.com/prl

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
                "url": "stratum+ssl://prl.kryptex.network:8048",
                "miner": "pearlfortune",
                "template": "%WAL%",
                "install_url": "https://github.com/pearlfortune/pearl-miner/releases/download/v2.1.5/pearlfortune-v2.1.5.tar.gz",
                "user_config": "--stratum-dialect kryptex_prl"
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
    pearlfortune/pearl-miner:v2.1.5 \
    --proxy global.pearlfortune.org:443 \
    --address {prl-address} \
    --worker "$(hostname)" \
    -gpu

## Logs
docker logs -f pearl-miner
```


#### Windows

1. Download and unzip `miner-windows-v1.2.4.zip`.
2. Right-click `start-miner.bat` -> Edit, then set:
   - `WALLET` — your PRL payout address
   - `WORKER` — a name for this rig (e.g. `rig01`)
   - `PROXY` — leave as `global.pearlfortune.org:443` unless told otherwise
3. Double-click `start-miner.bat`.

The launcher restarts the miner automatically 5 seconds after it exits. Close the window (or press `Ctrl+C`) to stop.

```
## Manual / advanced run
miner.exe --proxy global.pearlfortune.org:443 --address {prl-address} --worker workername -gpu
```

