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
| RTX 5090 | 402.27 TH/s | 573.3 W |
| RTX 5090 D v2 | 285.74 TH/s | 573.6 W |
| RTX 5090 D | 273.42 TH/s | — |
| RTX 5080 | 218.03 TH/s | 334.8 W |
| RTX 5070 Ti | 187.72 TH/s | 253.5 W |
| RTX 5070 | 125.03 TH/s | 186.0 W |
| RTX 5070 Laptop | 90.51 TH/s | — |
| RTX 5060 Ti | 96.11 TH/s | 149.8 W |
| RTX 5060 | 77.05 TH/s | 128.0 W |

### NVIDIA RTX 40 Series

| GPU | Hashrate | Power |
|---|---:|---:|
| RTX 4090 | 315.67 TH/s | 441.0 W |
| RTX 4090 D | 284.45 TH/s | 420.9 W |
| RTX 4090 Laptop | 163.36 TH/s | 109.2 W |
| RTX 4080 SUPER | 206.49 TH/s | 262.2 W |
| RTX 4080 | 199.05 TH/s | 281.7 W |
| RTX 4080 Laptop | 128.70 TH/s | 109.0 W |
| RTX 4070 Ti SUPER | 168.87 TH/s | 231.7 W |
| RTX 4070 Ti | 162.25 TH/s | 237.6 W |
| RTX 4070 SUPER | 144.77 TH/s | 209.6 W |
| RTX 4070 | 120.39 TH/s | 163.4 W |
| RTX 4070 Laptop | 80.67 TH/s | 96.7 W |
| RTX 4060 Ti | 86.32 TH/s | 139.3 W |
| RTX 4060 | 61.54 TH/s | — |
| RTX 4060 Laptop | 54.09 TH/s | 71.8 W |

### NVIDIA RTX 30 Series

| GPU | Hashrate | Power |
|---|---:|---:|
| RTX 3090 | 119.65 TH/s | 343.1 W |
| RTX 3080 Ti | 129.68 TH/s | 301.7 W |
| RTX 3080 | 106.73 TH/s | 304.1 W |
| RTX 3080 Laptop | 70.10 TH/s | 90.6 W |
| RTX 3070 Ti | 73.50 TH/s | 175.9 W |
| RTX 3070 Ti Laptop | 70.74 TH/s | 75.0 W |
| RTX 3070 | 72.74 TH/s | 162.9 W |
| RTX 3070 Laptop | 59.55 TH/s | 95.2 W |
| RTX 3060 Ti | 59.82 TH/s | 145.1 W |
| RTX 3060 | 47.50 TH/s | 115.7 W |
| RTX 3060 Laptop | 42.08 TH/s | 52.4 W |

### NVIDIA RTX 20 Series

| GPU | Hashrate | Power |
|---|---:|---:|
| RTX 2080 Ti | 82.08 TH/s | 235.9 W |
| RTX 2080 | 64.33 TH/s | — |
| RTX 2070 SUPER | 61.28 TH/s | — |
| RTX 2070 | 48.30 TH/s | — |
| RTX 2070 with Max-Q Design | 38.68 TH/s | — |
| RTX 2060 SUPER | 43.62 TH/s | 123.7 W |
| RTX 2060 | 33.90 TH/s | 97.5 W |

### NVIDIA Data Center and Workstation

| GPU | Hashrate | Power |
|---|---:|---:|
| H100 80GB HBM3 | 783.10 TH/s | 697.9 W |
| H800 | 623.91 TH/s | — |
| Tesla T4 | 30.91 TH/s | 69.2 W |
| NVIDIA CMP 90HX | 69.90 TH/s | 248.5 W |
| NVIDIA CMP 170HX | 142.97 TH/s | — |
| A100-PCIE-40GB | 215.81 TH/s | 251.2 W |
| A100-SXM4-80GB | 211.22 TH/s | 390.3 W |
| RTX A4000 | 59.15 TH/s | 139.0 W |
| NVIDIA CMP 50HX | 74.00 TH/s | 133.1 W |
| NVIDIA CMP 40HX | 41.11 TH/s | — |
| RTX A5000 | 86.06 TH/s | 227.4 W |
| RTX PRO 5000 72GB Blackwell | 286.19 TH/s | — |
| Quadro RTX 6000 | 81.45 TH/s | — |
| Tesla T10 | — | 127.6 W



## Get Started

#### Servers

```ini
global.pearlfortune.org:443
jp.pearlfortune.org:443
```



#### Linux (NVIDIA)

```sh
## Download
wget -c https://github.com/pearlfortune/pearl-miner/releases/download/v2.2.6/pearlfortune-v2.2.6.tar.gz \
&& tar vxzf pearlfortune-v2.2.6.tar.gz \
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
                "install_url": "https://github.com/pearlfortune/pearl-miner/releases/download/v2.2.6/pearlfortune-v2.2.6.tar.gz",
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
                "install_url": "https://github.com/pearlfortune/pearl-miner/releases/download/v2.2.6/pearlfortune-v2.2.6.tar.gz",
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
    pearlfortune/pearl-miner:v2.2.6 \
    --proxy global.pearlfortune.org:443 \
    --address {prl-address} \
    --worker "$(hostname)" \
    -gpu

## Logs
docker logs -f pearl-miner
```


#### Windows

1. Download and unzip `miner-windows-v2.2.6.zip`.
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

