"""
Inference module for Face Mask Detection using Ultralytics YOLO.

"""

import os

from ultralytics import YOLO

from bsort.utils import load_config


def run_inference(
    config_path: str, image_path: str, save_dir: str = "runs/inference"
) -> None:
    """Run inference on a single image.

    Args:
        config_path: Path to YAML config file.
        image_path: Path to input image.
        save_dir: Directory to save output image with detections.

    Returns:
        None
    """
    cfg = load_config(config_path)

    # Load YOLO model
    model = YOLO(cfg["weights_path"])

    # Run inference
    results = model.predict(
        source=image_path,
        conf=cfg.get("conf_threshold", 0.25),
        iou=cfg.get("iou_threshold", 0.45),
        save=True,
        save_dir=save_dir,
        verbose=True,
    )

    print(f"Inference completed. Results saved in {os.path.abspath(save_dir)}")
