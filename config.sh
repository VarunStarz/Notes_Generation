# !/bin/bash

if ! command -v python3 &> /dev/null; then
    echo "Python3 is not installed. Installing..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        brew install python3
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        sudo apt-get update
        sudo apt-get install -y python3 python3-pip python3-venv
    else
        echo "Please install Python3 manually for your operating system"
        exit 1
    fi
fi

if ! command -v pip3 &> /dev/null; then
    echo "pip3 is not installed. Installing..."
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt-get install -y python3-pip
    fi
fi
# Check if git is installed


# Create and activate a virtual environment
echo "Creating virtual environment..."
python3 -m venv venv
source venv/bin/activate

# Upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip

# Install required packages from requirements.txt
echo "Installing dependencies from requirements.txt..."
pip install -r requirements.txt

# Check if Tesseract is installed (for OCR functionality)
if ! command -v tesseract &> /dev/null; then
    echo "Tesseract OCR is not installed. Installing..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        brew install tesseract
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        sudo apt-get update
        sudo apt-get install -y tesseract-ocr
    else
        echo "Please install Tesseract OCR manually for your operating system"
    fi
fi



echo "Setup completed! You can now use the virtual environment for your video-to-text conversion."
echo "The project is now a git repository. You can add a remote origin and push your changes."