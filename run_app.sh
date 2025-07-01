#!/bin/bash

echo "Starting Human-in-the-Loop PDF Annotation Tool..."

# Check if virtual environment exists
if [ ! -d ".venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv .venv
    echo "Virtual environment created."
fi

# Activate virtual environment
echo "Activating virtual environment..."
source .venv/bin/activate

# Install requirements if needed
if [ ! -f ".venv/bin/streamlit" ]; then
    echo "Installing requirements..."
    pip install -r requirements.txt
    echo "Requirements installed."
fi

# Run the app
echo "Starting Streamlit app..."
cd gui
streamlit run app.py