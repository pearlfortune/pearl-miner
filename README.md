# Pearl Fortune Mining Guide

[English](./README.md) | [简体中文](./README.zh-CN.md)

Pearl Fortune pool setup for the official miner and third-party mining software.

- [Website](https://pearlfortune.org/)
- [Discord](https://discord.gg/aDJwPb3rW)
- [Official miner and releases](https://github.com/pearlfortune/pearl-miner)
- [Official Docker image](https://hub.docker.com/r/pearlfortune/pearl-miner)

## Quick Start

1. Prepare a public PRL payout address and identify your GPU.
2. Choose the official Pearl Fortune miner or a third-party miner that supports your GPU.
3. Follow the matching example below, replacing `YOUR_PRL_ADDRESS` with your payout address.
4. Confirm that the miner stays running, connects to the pool, and receives accepted shares.

### Pool Endpoints

**Official Pearl Fortune miner** (`pearl-miner`, including its HiveOS and Docker packages):

- Global: `global.pearlfortune.org:443`
- Japan: `jp.pearlfortune.org:443`

**Third-party mining software** (SRBMiner, PeakMiner, ForgeMiner, RGMiner, BzMiner):

- Global: `global.pearlfortune.org:8888`
- Japan: `jp.pearlfortune.org:8888`

### Dual Mining and Reward Schemes

- **PRL + NOCK:** PF Pool supports dual mining. **Only a PRL payout address is required for dual mining.**
- **PRL:** PPS and PPLNS are available; PPS is the default.
- **NOCK:** PPLNS only.
- **To switch PRL between PPS and PPLNS:** Contact an administrator.

### Connection Notes

- **SSL support:** Both pool ports support SSL.
- **Miner-specific syntax:** Some tested commands contain `stratum+tcp://`, and the HiveOS flight sheets set `pool_ssl` to `false`. Keep each example's protocol and SSL fields as written. Changing them to `stratum+ssl://` or enabling the HiveOS SSL switch can cause compatibility errors in some miners.
- **Password:** A pool password is optional. The `"pass": "x"` values in some flight sheets are part of those tested examples, not a PF Pool requirement.
- **Region:** The examples use the global endpoint. To try Japan, replace `global.pearlfortune.org` with `jp.pearlfortune.org` everywhere it appears in that command or flight sheet, including `pool_urls`, `miner_config.url`, and `miner_config.user_config` where present. Keep the same port.
- **Wallet:** Replace `YOUR_PRL_ADDRESS` in command examples with your public payout address. In HiveOS JSON, keep `%WAL%` and `%WORKER_NAME%` unchanged; HiveOS fills them in.

### Using the HiveOS Flight Sheets

1. Create or select your PRL wallet in HiveOS.
2. Import the JSON for your chosen miner, then select that wallet.
3. Apply the flight sheet to your worker and check the mining result below.

The flight sheets below are PF Pool-tested examples for the listed miner versions. Preserve their miner names, wallet templates, protocol fields, and extra arguments when importing them.

## Official Pearl Fortune Miner

Official miner examples use port `443`. Use `jp.pearlfortune.org:443` as an alternative.

### Linux (NVIDIA)

Download and enter the extracted directory:

```sh
wget -c https://github.com/pearlfortune/pearl-miner/releases/download/v2.2.9/pearlfortune-v2.2.9.tar.gz \
&& tar vxzf pearlfortune-v2.2.9.tar.gz \
&& cd pearlfortune
```

Run the command matching the CUDA version supported by your driver:

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

### HiveOS (NVIDIA)

The official Pearl Fortune HiveOS flight sheet selects the CUDA executable automatically based on the installed driver. Import it as shown; there is no need to specify `miner-cuda12` or `miner-cuda13`.

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

### Docker (NVIDIA)

[Docker Hub](https://hub.docker.com/r/pearlfortune/pearl-miner)

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

1. Download and unzip `miner-windows-v2.2.9.zip` from the [official v2.2.9 release](https://github.com/pearlfortune/pearl-miner/releases/tag/v2.2.9).
2. Right-click `start-miner.bat` -> Edit, then set:
   - `WALLET` — your PRL payout address
   - `WORKER` — a name for this rig (e.g. `rig01`)
   - `PROXY` — use `global.pearlfortune.org:443` or `jp.pearlfortune.org:443`
3. Double-click `start-miner.bat`.

The launcher restarts the miner automatically 5 seconds after it exits. Close the window (or press `Ctrl+C`) to stop.

```bat
REM Manual / advanced run
miner.exe --proxy global.pearlfortune.org:443 --address YOUR_PRL_ADDRESS --worker workername -gpu
```

## Third-Party Mining Software

These miners are developed and maintained by independent projects. Use PF Pool's **port `8888`** with them. Hardware support, miner fees, and command-line options depend on the miner and version; a flight sheet cannot add hardware support that the miner itself lacks.

The examples below use specific release versions. Check the miner's release page before changing versions, and keep the connection syntax shown for that miner.

For Windows, download the matching Windows package from the miner's release page before running its command.

If you use the Japan endpoint, replace `global.pearlfortune.org` with `jp.pearlfortune.org` throughout the command or HiveOS JSON; keep port `8888`.

### SRBMiner

[SRBMiner releases](https://github.com/doktor83/SRBMiner-Multi/releases)

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

[PeakMiner releases](https://github.com/peakminer/peakminer/releases)

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

[ForgeMiner releases](https://github.com/0xHashRaptor/ForgeMiner/releases)

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

[RGMiner releases](https://github.com/Printscan/rgminer/releases)

**Linux**

```sh
wget https://github.com/Printscan/rgminer/releases/download/v1.1.2/rgminer-1.1.2
chmod +x rgminer-1.1.2
./rgminer-1.1.2 --algo pearl --stratum global.pearlfortune.org:8888 --wallet YOUR_PRL_ADDRESS
```

Add `-d 0` to select GPU 0 when needed.

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

[BzMiner releases](https://github.com/bzminer/bzminer/releases)

Adjust the `--nvidia`, `--amd`, and `--intel` switches to match your hardware.

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

> If you have a delayed OC on 30xx, 40xx, or 50xx series, make sure you manually select kernel 2.
>
> `--kernel 2`

**Linux**

```sh
wget https://github.com/OneZeroMiner/onezerominer/releases/download/v1.8.0/onezerominer-1.8.0.tar.gz
tar xzf onezerominer-1.8.0.tar.gz && cd onezerominer
./onezerominer --algo=pearl --wallet=YOUR_PRL_ADDRESS --pool=global.pearlfortune.org:8888 --worker $(hostname)
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





## Check Your Setup

After starting the miner, check all three results:

1. The miner process stays running and detects the GPU you intended to use.
2. The miner connects to the selected PF Pool endpoint.
3. The miner log reports accepted shares.

A successful download or HiveOS import alone does not prove that mining works. If the process exits immediately, inspect its log and try the same miner command directly. Check the miner's GPU support before changing a tested pool URL or protocol setting.

## Reference GPU Performance

The following hash rate table is based on statistics from version v2.2.6.

### NVIDIA RTX 50 Series

| GPU             |    Hashrate |   Power |
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

### NVIDIA RTX 40 Series

| GPU               |    Hashrate |   Power |
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

### NVIDIA RTX 30 Series

| GPU                |    Hashrate |   Power |
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

### NVIDIA RTX 20 Series

| GPU                        |   Hashrate |   Power |
| -------------------------- | ---------: | ------: |
| RTX 2080 Ti                | 82.08 TH/s | 235.9 W |
| RTX 2080                   | 64.33 TH/s |       — |
| RTX 2070 SUPER             | 61.28 TH/s |       — |
| RTX 2070                   | 48.30 TH/s |       — |
| RTX 2070 with Max-Q Design | 38.68 TH/s |       — |
| RTX 2060 SUPER             | 43.62 TH/s | 123.7 W |
| RTX 2060                   | 33.90 TH/s |  97.5 W |

### NVIDIA Data Center and Workstation

| GPU                         |    Hashrate |   Power |
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
