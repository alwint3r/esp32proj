esp32proj
=========

Initialize ESP32 project from a very simple template.

## Installation

Clone this repository. 

```bash
$ git clone https://github.com/alwint3r/esp32proj.git ~/esp32proj
```

Here I cloned the repository to the `esp32proj` directory inside home directory.

Next, set the `ESP32PROJ_PATH` environment variable with the path to esp32proj directory.

```bash
$ export ESP32PROJ_PATH=$HOME/esp32proj
```

Next append the value of `ESP32PROJ_PATH` environment variable to the `PATH` environment variable.

```bash
$ export PATH=$PATH:$ESP32PROJ_PATH
```

It's better to append those two lines to the `.bash_profile` or `.profile` or `.bash_rc` file inside the home directory.

## Usage

```bash
esp32proj_init.sh [PROJECT_NAME]
```

## Example

```bash
esp32proj_init.sh ./blinking
```

This will create `blinking` project folder under the current working directory.

