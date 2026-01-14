"""
Utility functions for Bottle Cap Color Classifier.
"""

import yaml


def load_config(path: str):
    """Load a YAML configuration file and return it as a dictionary."""
    with open(path, "r", encoding="utf-8") as f:
        return yaml.safe_load(f)
