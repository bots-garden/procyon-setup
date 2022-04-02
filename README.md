# Procyon install

> - This repository is dedicated to the installation of Procyon `v0.0.7`.
> - You can test the setup by opening it with Gitpod
[![Open in GitPod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/bots-garden/procyon-setup)

🚧 This is a work in progress
> - Make a diagram
> - What is procyon
> - Source code


## Procyon components

## Install Procyon components

```bash
./install-procyon-amd64.sh
```

### Certificates for Venusia

**[Sat](https://github.com/suborbital/sat)** can run a wasm module from an URL, and this URL must be HTTPS and must have a `.wasm` suffix.

**Venusia** is a small server that serves wasm files, you can use it to provide wasm modules to **Sat**. You need certificates to run **Venusia**:

```bash
cd venusia
REGISTRY_CRT="venusia.local.crt" \
REGISTRY_KEY="venusia.local.key" \
REGISTRY_HTTP=9999 \
./venusia
```
You can use your own certificates, or, for local and development experiments you can use **[Mkcert](https://github.com/FiloSottile/mkcert)**, so run the below command:

```bash
./install-mkcert-amd64.sh
```
> This command will install mkcert and generate certificates for Venusia.

### Install Sat for using it with Procyon

```bash
./install-sat-amd64.sh
```
> This command will clone the Sat repository, build Sat and copy `sat` binary to `/procyopn/executors` directory.

### Install Subo CLI

To create wasm modules for **Sat**, you need the **[Subo CLI](https://github.com/suborbital/subo)**. To install the **Subo CLI**, type the below command:

```bash
./install-subo-amd64.sh
```
> - This command will install Subo
> - Requirement for the amd64 version: you need to install **[Brew](https://docs.brew.sh/Homebrew-on-Linux)** before running the setup of **Subo**

## Start Procyon stack (or Procyon components)

```bash
nohup ./start-venusia.sh &
nohup ./start-alcor.sh &
nohup ./start-procyon.sh &
```

## Create a Runnable for Sat

```bash
subo create runnable hello --lang tinygo
cd hello
subo build .
```

### Publish the Runnable to Venusia

```bash
curl -v \
  -F "file=@./hello/hello.wasm" \
	-H "Content-Type: multipart/form-data" \
	-X POST https://localhost:9999/wasm/upload
```

### Launch a Sat task to serve the Runnable

```bash
curl -v --request POST \
  --header 'Content-Type: application/json' \
  --data '{
      "executor": 1,
      "wasmFileName": "hello.wasm",
      "wasmRegistryUrl": "https://localhost:9999/wasm/download/hello.wasm",
      "functionName": "hello",
      "functionRevision": "first",
      "defaultRevision": true
    }
  ' http://localhost:9090/tasks
```

### Call the function

```bash
curl -X POST -d 'Jane' http://localhost:8080/functions/hello; echo ""
```
