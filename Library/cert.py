# cert.py
import urllib3

# Disable SSL warnings
urllib3.disable_warnings()

# Define a keyword function
def disable_ssl_warnings():
    """Disables SSL warnings."""
    urllib3.disable_warnings()
