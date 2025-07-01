# Human-in-the-Loop PDF Annotation & Correction Tool

A Streamlit application that allows users to upload PDF files and OCR data, view and edit OCR results, and export corrected data.

## Features

- Upload multiple PDF invoices
- Upload a CSV containing OCR/VLM output for those PDFs
- Select any PDF from the uploaded set
- Optionally run PaddleOCR on a PDF if OCR rows are missing
- Display the selected PDF page as an image with green bounding boxes for every OCR entry
- Show the corresponding CSV rows in an editable table on the right
- When clicking a row, highlight its box in red on the PDF image
- Allow inline editing of text and other fields in the table
- Persist edits in session state and on-disk
- Export a corrected CSV with extra metadata columns

## Project Structure

```
HITL_OCR_App/
├── gui/
│   └── app.py              # Main Streamlit app
├── scripts/
│   ├── ocr_runner.py       # Runs PaddleOCR → outputs CSV
│   └── utils.py            # PDF→image, draw_boxes, match logic
├── data/
│   ├── uploaded_pdfs/      # Store uploaded PDFs
│   └── vlm_output.csv      # Uploaded ground-truth OCR CSV
└── outputs/
    └── corrected_output.csv # Exported corrected data
```

## Setup and Installation

1. Create and activate a virtual environment:

```bash
python3 -m venv .venv
source .venv/bin/activate   # macOS/Linux
.venv\Scripts\activate      # Windows
```

2. Install dependencies:

```bash
pip install -r requirements.txt
```

## Running the Application

```bash
cd gui
streamlit run app.py
```

The application will be available at http://localhost:8501

## CSV Format

The input CSV should have the following columns:
- `filename`: Name of the PDF file
- `page`: Page number (1-indexed)
- `text`: Extracted text
- `x1`, `y1`, `x2`, `y2`: Bounding box coordinates
- `confidence`: (Optional) Confidence score from OCR

The output CSV will include additional metadata columns:
- `corrected_text`: The corrected version of the text
- `correction_status`: Status of the correction ("original" or "edited")
- `timestamp`: When the correction was made
- `annotator`: Who made the correction

## Usage Instructions

1. Upload PDF files using the sidebar uploader
2. Upload a CSV file with OCR data (optional)
3. Select a PDF from the dropdown menu
4. Navigate to the desired page using the slider
5. If OCR data is missing, click the "Run OCR" button
6. View the PDF with bounding boxes around detected text
7. Edit text in the table on the right
8. Click on a row to highlight the corresponding box in red
9. Save or download the corrected data using the buttons in the sidebar