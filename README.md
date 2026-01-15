# Face Mask Detection

![Python](https://img.shields.io/badge/python-3.11-blue)
![Docker](https://img.shields.io/badge/docker-ready-success)
![CI/CD](https://img.shields.io/badge/CI-CD-brightgreen)


## Overview
**bsort** is a complete machine-learning pipeline for face mask detection using a YOLO-based model. It provides a Python CLI for training and inference, a YAML configuration system and optional training dependencies. The project emphasizes reproducibility, automation, clean code, and practical ML engineering.

## Features
- End-to-end ML workflow (training and inference)
- Config-driven pipeline (`settings.yaml`)
- YOLO-based detector using Ultralytics
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
List of Library used for this pipeline:
numpy = to enable some Ultralytics library
pyyaml = enables to write and edit yaml file
ultralytics = a library that enables us to use YOLOv5n and YOLOv8n. It also provides tools related for training and infering on YOLO models.

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
The training and inference for the model in the notebook is done on colab using a free CPU-only resource.

CPU Spec used for training and inference on colab:
| Feature                         | Value                                                             |
| ------------------------------- | ----------------------------------------------------------------- |
| CPU                             | Intel® Xeon® CPU @ 2.20 GHz                                       |
| Physical cores                  | 1                                                                 |
| Logical cores (threads)         | 2 (hyperthreaded)                                                 |
| Cache                           | 56 320 KB (L3)                                                    |
| Max frequency                   | 2.2 GHz                                                           |
| Supported extensions            | SSE, SSE2, SSE3, SSSE3, SSE4.1, SSE4.2, AVX, AVX2, FMA, AES, etc. |
| Total RAM (reported separately) | ~12–13 GB in Colab free                                           |

Model weights or artifacts that has been trained through the notebook can be found in the folder model. For now it has a YOLOv5n model (in .pt and .onnx) and YOLOv8n model (in .pt).

After training, it will be saved in the runs folder. Or if you start a new one, it will automatically create and save in the runs/bsort_experiment.
After inferencing, results can be seen runs/inference folder. Or if you start a new one, it will automatically create and save in the runs/inference.

There are already examples in the runs folder. If you would like to try to train or inference, you can crosscheck your results with the one in the runs/bsort_experiment for training and runs/inference for inference.

## Summary, findings and next step
This face mask development is done using Yolov5n. It is chosen due to its small size (1.9M parameter) while still able to perform. Dataset is taken from kaggle and preprocessed using Roboflow. For more details and explanation, it is explained on the folder Notebooks/facemask_detection_development.ipynb. At the final part, the issue is also trained using YOLOv8n. This is done for the sake of pipeline implementation (witht the limited time available, the current end-to-end pipeline can only work using Yolov8 model). So the Yolov8n model is used as a dummy / placeholder on how does the model, that is trained on notebook, used after the training process and integrated to an end-to-end system.


The model has shown a good performance, a mAP50 score of 0.915 and 0.712 when used on the test set to classify object with_mask and without_mask. Unfortunately in the same category, the class mask_wear_incorrect only achieved around 0.164. This is due the dataset imbalance (lack of mask_wear_incorrect data during training) which prevents the model from understanding that class.

The biggest limitations is currently the dataset itself. Inbalance data variant between class really made the model perform worst on the lacking class. Another issue with the lack of time is the limitation of experimentation. Authot does not have enough time to try other architecture besides YOLO and hyperparameter teesting. For furhter explanation, it is explained in the notebook on the Notebooks/facemask_detection_developmen.ipynb


## License
This project is licensed under the MIT License - see the LICENSE file for details.
