if ! command -v git &> /dev/null; then
    echo "Git is not installed. Installing..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        brew install git
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        sudo apt-get update
        sudo apt-get install -y git
    else
        echo "Please install Git manually for your operating system"
        exit 1
    fi
fi

git clone 
cd vidtotxt

chmod +x config.sh
./config.sh