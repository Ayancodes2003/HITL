@echo off
echo Starting Human-in-the-Loop PDF Annotation Tool...

:: Check if virtual environment exists
if not exist .venv (
    echo Creating virtual environment...
    python -m venv .venv
    echo Virtual environment created.
)

:: Activate virtual environment
echo Activating virtual environment...
call .venv\Scripts\activate

:: Install requirements if needed
if not exist .venv\Scripts\streamlit.exe (
    echo Installing requirements...
    pip install -r requirements.txt
    echo Requirements installed.
)

:: Run the app
echo Starting Streamlit app...
cd gui
streamlit run app.py

pause