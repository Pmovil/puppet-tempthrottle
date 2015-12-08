# tempthrottle

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with tempthrottle](#setup)
    * [What tempthrottle affects](#what-tempthrottle-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with tempthrottle](#beginning-with-tempthrottle)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Controls the cpu frequency in order to avoid overheating.

## Module Description

Under the hood it uses a fork from https://github.com/Sepero/temp-throttle

## Setup

### What tempthrottle affects
It creates a new SystemD service that monitors the temp-throttle script

### Setup Requirements
In your puppet path you must clone our temp-throttle fork:
```
cd files && mkdir tempthrottle && cd tempthrottle && git clone https://github.com/Pmovil/temp-throttle.git && cd temp-throttle && git checkout testing
```

### Beginning with tempthrottle


## Usage


## Reference


## Limitations

Tested on CentOS 7, requires SystemD to work.

## Development


## Release Notes/Contributors/Etc **Optional**

Thanks to Sepero for the temp-throttle script
