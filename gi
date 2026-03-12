stages:
  - test

test:
  stage: test

  cache:
    key: pip-cache
    paths:
      - .cache/pip/

  script:
    # Create virtual environment
    - python -m venv .venv

    # Install dependencies
    - .\.venv\Scripts\python.exe -m pip install --cache-dir .cache\pip -r requirements.txt

    # Run tests
    - .\.venv\Scripts\python.exe --version
    - .\.venv\Scripts\python.exe -m unittest discover -s tests -p "test_*.py" -v