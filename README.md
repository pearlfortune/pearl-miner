# pearl-miner

Website: https://pearlfortune.org/

Discord: https://discord.gg/Tv2XzcyDH

Github: https://github.com/pearlfortune/pearl-miner


## Measured GPU Performance

Methodology: hashrate is the measured single-GPU P90 hashrate from live telemetry, and power is the average power near the P90 hashrate sample window. Snapshot time: 2026-06-01 00:23:50 JST.

| GPU | Hashrate | Power |
|---|---:|---:|
| RTX 4090 | 265.81 TH/s | 449.0 W |
| RTX 4070 Ti SUPER | 154.44 TH/s | 284.5 W |
| A100-PCIE-40GB | 191.83 TH/s | 249.9 W |
| RTX 5090 | 322.45 TH/s | 575.8 W |
| RTX 4070 SUPER | 111.19 TH/s | 194.8 W |
| RTX 4090 D | 239.61 TH/s | 420.8 W |
| RTX 4070 | 104.38 TH/s | 196.3 W |
| RTX 5060 | 64.61 TH/s | 95.7 W |
| RTX 5060 Ti | 77.32 TH/s | 120.8 W |
| RTX 3080 | 93.01 TH/s | 319.3 W |
| RTX 3090 | 104.22 TH/s | 348.3 W |
| RTX 3070 | 46.92 TH/s | 142.8 W |
| RTX 4070 Ti | 121.61 TH/s | 180.0 W |
| A100-SXM4-80GB | 221.56 TH/s | 401.9 W |
| RTX 4060 Ti | 67.78 TH/s | 110.0 W |
| Tesla V100-SXM2-32GB | 48.83 TH/s | 275.4 W |
| RTX 5090 D v2 | 284.66 TH/s | 575.0 W |
| RTX 5080 | 161.26 TH/s | 309.8 W |
| NVIDIA L20 | 109.58 TH/s | 279.5 W |
| RTX 5070 Ti | 146.19 TH/s | 293.3 W |
| MetaX C500 | 109.24 TH/s | 306.7 W |
| RTX 3080 Ti | 103.70 TH/s | 349.1 W |
| RTX 3060 Ti | 40.12 TH/s | 119.8 W |
| RTX 5070 | 103.02 TH/s | 175.0 W |
| RTX 3070 Laptop | 44.82 TH/s | 109.1 W |
| RTX 3060 | 35.82 TH/s | 114.8 W |
| RTX 4080 SUPER | 176.06 TH/s | 319.6 W |
| NVIDIA L40S | 218.83 TH/s | 349.3 W |
| RTX 5090 D | 283.78 TH/s | 575.0 W |
| RTX 3080 Laptop | 54.60 TH/s | 88.7 W |
| RTX PRO 6000 Blackwell | 302.09 TH/s | 500.0 W |
| Tesla V100S-PCIE-32GB | 33.68 TH/s | 197.2 W |
| RTX 3070 Ti Laptop | 46.32 TH/s | 90.8 W |


## Get Started

#### Linux

```sh
./miner \
--proxy jp.pearlfortune.org:443 \
--address {prl-address} \
--worker $(hostname) \
-gpu
```

#### HiveOS

```json
{
    "name": "pearl",
    "isFavorite": false,
    "items": [
        {
            "coin": "pearl",
            "pool_ssl": false,
            "wal_id": 11059341,
            "dpool_ssl": false,
            "miner": "custom",
            "miner_alt": "pearlfortune",
            "miner_config": {
                "url": "jp.pearlfortune.org:443",
                "miner": "pearlfortune",
                "template": "%WAL%",
                "install_url": "https://github.com/pearlfortune/pearl-miner/releases/download/v1.0.5/pearlfortune-v1.0.5.tar.gz",
                "user_config": ""
            },
            "pool_geo": [

            ]
        }
    ]
}
```
