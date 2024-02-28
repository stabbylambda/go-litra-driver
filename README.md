![Go workflow](https://github.com/kharyam/go-litra-driver/actions/workflows/go.yml/badge.svg) [![Go Report Card - config](https://goreportcard.com/badge/github.com/kharyam/go-litra-driver/config)](https://goreportcard.com/report/github.com/kharyam/go-litra-driver/config)[![Go Report Card - lib](https://goreportcard.com/badge/github.com/kharyam/go-litra-driver/lib)](https://goreportcard.com/report/github.com/kharyam/go-litra-driver/lib)[![Go Report Card - cli](https://goreportcard.com/badge/github.com/kharyam/go-litra-driver/cli)](https://goreportcard.com/report/github.com/kharyam/go-litra-driver/cli)[![Go Report Card - ui](https://goreportcard.com/badge/github.com/kharyam/go-litra-driver/ui)](https://goreportcard.com/report/github.com/kharyam/go-litra-driver/ui)
# Go utility for Litra Glow and Beam

## Introduction

After purchasing a [Logitech Litra Glow](https://www.logitech.com/en-us/products/lighting/litra-glow.946-000001.html) I was unable to find any support for linux. [I created a python project](https://github.com/kharyam/litra-driver) which reverse-engineered the basic functionality of the litra glow so that we can control it via USB without using the physical buttons on the device. It also now supports the [Logitech Litra Beam](https://www.logitech.com/en-us/products/lighting/litra-beam.946-000006.html). This project is the port from python to go.


## Quick Start

### Linux
```bash
# If necessary, create a udev role to grant permission to access the light
sudo tee /etc/udev/rules.d/82-litra-glow.rules <<< 'SUBSYSTEM=="usb", ATTR{idVendor}=="046d", ATTR{idProduct}=="c900",MODE="0666"'
sudo tee /etc/udev/rules.d/82-litra-beam.rules <<< 'SUBSYSTEM=="usb", ATTR{idVendor}=="046d", ATTR{idProduct}=="c901",MODE="0666"'

# For most operating systems, reloading udev rules is enough
sudo udevadm control --reload-rules
sudo udevadm trigger

# For others, a reboot may be required
# sudo reboot

# Command Line Interface
lcli --help

# User Interface
lcui

```

## The UI
A basic UI can be launched to allow control of the light:

```bash
lcui
```

![lcui Screen Shot](images/lcui.png)

## The CLI

```bash
This command line interface allows you to control a litra Glow or Beam 
device using the commands described below.

Usage:
  cli [command]

Available Commands:
  bright      Sets the brightness level (0-100)
  completion  Generate the autocompletion script for the specified shell
  help        Help about any command
  off         Turn lights off
  on          Turn lights on
  temp        Sets the temperature of the lights (2700 - 6500)

Flags:
  -h, --help     help for cli
  -t, --toggle   Help message for toggle

Use "cli [command] --help" for more information about a command.
```

Sample Usage
```bash
lcli on
lcli bright 10
lcli temp 6500
lcli off
```

## Development

### Build Locally

```bash

git clone git@github.com:kharyam/go-litra-driver.git
cd go-litra-driver
go build -v ./config
go build -v ./lib
go build -o lcli -v ./cli
go build -o lcui -v ./ui
```

### Cobra Config (for future reference)

```bash

cd cli

# Workaround when using workspaces
GOWORK=off cobra-cli init .

# Create skeleton code for each command
cobra-cli add on
cobra-cli add off
cobra-cli add bright
cobra-cli add temp
```

### Publishing

```bash
export VERSION=v0.0.2

cd config
go mod tidy
cd ../lib
go mod tidy
cd ../cli
go mod tidy
cd ../ui
go mod tidy

GOPROXY=proxy.golang.org go list -m github.com/kharyam/go-litra-driver/config@${VERSION}
GOPROXY=proxy.golang.org go list -m github.com/kharyam/go-litra-driver/lib@${VERSION}
GOPROXY=proxy.golang.org go list -m github.com/kharyam/go-litra-driver/cli@${VERSION}
GOPROXY=proxy.golang.org go list -m github.com/kharyam/go-litra-driver/ui@${VERSION}
```

### Packaging
```bash
podman build -t kharyam/fyne-cross-images:linux build/linux

cd cli
fyne-cross linux --arch=amd64 --image=kharyam/fyne-cross-images:linux --app-id=net.kharyam.lcli
fyne-cross windows --arch=amd64 --app-id=net.kharyam.lcli
# TODO - Package for OSx
#fyne-cross darwin --arch=amd64 --app-id=net.kharyam.lcli

cd ../ui
fyne-cross linux --arch=amd64 --image=kharyam/fyne-cross-images:linux --app-id=net.kharyam.lcui
fyne-cross windows --arch=amd64 --app-id=net.kharyam.lcui
# TODO - Package for OSx
#fyne-cross darwin --arch=amd64 --app-id=net.kharyam.lcui
```
