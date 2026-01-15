# Face Mask Detection

![Python](https://img.shields.io/badge/python-3.11-blue)
![Docker](https://img.shields.io/badge/docker-ready-success)
![CI/CD](https://img.shields.io/badge/CI-CD-brightgreen)


## Overview
**bsort** is a complete machine-learning pipeline for face mask detection using a YOLO-based model. It provides a Python CLI for training and inference, a YAML configuration system, optional training dependencies and a Docker-ready deployment pipeline. The project emphasizes reproducibility, automation, clean code, and practical ML engineering.

## Features
- End-to-end ML workflow (training and inference)
- Config-driven pipeline (`settings.yaml`)
- YOLO-based detector/classifier using Ultralytics
- Type hints and Google-style docstrings
- CLI entrypoint: `python -m bsort.cli`
- CI pipeline including formatting, linting, tests, and Docker build

## Project Structure
```
root/
├── .github/
│   └── workflows/
│       └── ci.yml
│
├── bsort/
│   ├── cli.py
│   ├── train.py
│   ├── infer.py
│   └── utils.py
│
├── dataset/
│   ├── train/
│   ├── test/
│   ├── valid/
│   └── data.yaml
│
├── notebooks/
│   └── facemask_detection_development.ipynb
│
├── test/
│   └── unit_test.py
│
├── .dockerignore
├── .gitignore
├── Dockerfile
└── settings.yaml
```

## Instalation and setup

Clone the repo
```bash
git clone https://github.com/FajarKKP/Face_Mask_Detection.git
cd Face_Mask_Detection
```

Create a virtual environment (optional but recommended)
```bash
python -m venv venv
source venv/bin/activate   # Linux/macOS
venv\Scripts\activate      # Windows
```

Install main dependencies
```bash
pip install -r requirements.txt
```

## To use the CLI
The bsort can help you in training the model or to do inference. Inferencing here can be done towards a test set.

You can adjust the settings for training / inference in root/settings.yaml

## Example of usage
Train
```bash
python -m bsort.cli train --config settings.yaml
```

Inference
```bash
python -m bsort.cli infer --image dataset\sample.jpg --config settings.yaml
```

Help

```bash
python -m bsort.cli --help
```

Evaluation Metrics

CPU Spec used for inference:
| Feature                         | Value                                                             |
| ------------------------------- | ----------------------------------------------------------------- |
| CPU                             | Intel® Xeon® CPU @ 2.20 GHz                                       |
| Physical cores                  | 1                                                                 |
| Logical cores (threads)         | 2 (hyperthreaded)                                                 |
| Cache                           | 56 320 KB (L3)                                                    |
| Max frequency                   | 2.2 GHz                                                           |
| Supported extensions            | SSE, SSE2, SSE3, SSSE3, SSE4.1, SSE4.2, AVX, AVX2, FMA, AES, etc. |
| Total RAM (reported separately) | ~12–13 GB in Colab free                                           |
