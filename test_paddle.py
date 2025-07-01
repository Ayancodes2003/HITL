try:
    from paddleocr import PaddleOCR
    print("PaddleOCR import successful")
    # Try to create a PaddleOCR instance
    ocr = PaddleOCR(use_textline_orientation=True, lang='en')
    print("PaddleOCR instance created successfully")
except Exception as e:
    print(f"Error: {e}")