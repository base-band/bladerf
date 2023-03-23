# BladeRF
This repo is a hardware implementation of `q-engine` targeted at the **bladeRF 2.0 micro xA9**.

## bladeRF 2.0 micro xA9 Board Details

* Official **bladeRF 2.0 micro xA9** web Page: https://www.nuand.com/product/bladerf-xa9

* Schematic: https://www.nuand.com/bladeRF-micro.pdf

* Transceiver: Analog Devices **AD9361** : https://www.analog.com/en/products/ad9361

* FPGA Cyclone V **5CEBA9F23C8** : https://www.intel.com/content/dam/www/programmable/us/en/pdfs/literature/hb/cyclone-v/cv_51001.pdf

* USB3 Cypress FX3 https://www.cypress.com/products/ez-usb-fx3-superspeed-usb-30-peripheral-controller


# General Information for building
These instructions use `BB_PARENT` env variable to point at a folder which has multiple git repos inside.

# Synthesizing with Docker
The easiest way to get started with synthesis and building bitfiles is with the docker.
```bash
export BB_PARENT=/work/base-band       # update to fit your needs
docker run -dit --name bbq --net=host -v ${BB_PARENT}:/src ghcr.io/base-band/docker-images/quartus-ci-build:latest
docker exec -it bbq bash
ls  /src # check if the dirs look correct
cd /src/bladerf
make all
```

## Notes
If you press `ctrl+c` during a synth run and your text is still green, run `reset`.


# Simulating with Docker
The easiest way to get started with simulations is with the docker.

```bash
export BB_PARENT=/work/base-band       # update to fit your needs
docker run -dit --name bbv -v ${BB_PARENT}:/src ghcr.io/base-band/docker-images/verilator-4-016:latest
docker exec -it bbv bash
ls  /src # check if the dirs look correct
cd /src/bladerf/lib/hardware/sim/alpha/
make all
```




# Synthesizing on your host
This section has instructions without using Docker

* Download Quartus Prime Lite Edition: https://fpgasoftware.intel.com/?edition=lite
* Unpack `Quartus-lite-20.1.1.720-linux.tar` file.
* Run `setup.sh` to setup script.

## Build
Run:
* `make quartus`
* Quartus Scripting guide: https://www.intel.com/content/dam/www/programmable/us/en/pdfs/literature/ug/ug-qps-scripting.pdf


