
# Shkeeper Helm Chart and Docker Compose

A Helm chart and Docker Compose configuration for deploying blockchain-based services with Shkeeper.

## Features
- Support for multiple blockchain integrations (BTC, LTC, DOGE, etc.).
- Flexible configuration using `values.yaml`.
- Optional support for full nodes and Shkeeper API layers.

---

## Requirements

- **Helm 3.x or higher**: [Installation Guide](https://helm.sh/docs/intro/install/)
- **Docker and Docker Compose**: [Docker Installation](https://docs.docker.com/get-docker/)

---

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/shkeeper-repo.git
cd shkeeper-repo
```

---


#### Configure `values.yaml`

Edit the `values.yaml` file to configure the services based on your requirements. Example:

```yaml
btc:
  enabled: true
  mainnet: true
  bitcoind:
    image: vsyshost/bitcoind:27.0

ltc:
  enabled: true
  mainnet: true
```

### 2. Helm render docker-compose file

#### Render docker compose

```bash
helm template  shkeeper > docker-compose.yml
```

### 3. Start services



1. In the docker-compose.yaml file, set the login and password parameters for the services

2. Start the services with Docker Compose:

   ```bash
   docker-compose up -d
   ```

3. Verify the running containers:

   ```bash
   docker ps
   ```
4. The shkeeper application will be launched on port 5000

---

## Configuration

### Helm Parameters

The following table lists the configurable parameters in `values.yaml`:

| Parameter               | Description                               | Default       |
|-------------------------|-------------------------------------------|---------------|
| `btc.enabled`           | Enable BTC blockchain support            | `true`        |
| `ltc.enabled`           | Enable LTC blockchain support            | `false`       |
| `monero.enabled`        | Enable Monero blockchain support         | `true`        |
| `doge.enabled`          | Enable Doge blockchain support           | `true`        |


For a full list, refer to the `values.yaml` file.

---

## Supported Blockchains

- **Bitcoin (BTC)**
- **Litecoin (LTC)**
- **Dogecoin (DOGE)**
- **Monero (XMR)**
- **Tron (TRX, USDT, USDC)**
- **Ethereum (ETH, USDT, USDC)**
- **Binance Smart Chain (BNB, USDT, USDC)**
- **Polygon (MATIC, USDT, USDC)**
- **Avalanche (AVAX, USDT, USDC)**
- **Ripple (XRP)**

---



## Contact

For support or inquiries, please open an issue on GitHub or contact us at [support@v-sys.org](mailto:support@v-sys.org).

---
