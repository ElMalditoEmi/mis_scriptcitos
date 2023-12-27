venv_name="venv"
activate=true

deactivate(){
    deactivate
    if [ $? -eq 0 ]
    then
        echo "goodbye!"
        exit
    else
        echo "Error: You probably weren't in a venv"
        exit
    fi
}

while getopts "n:ad" arg; do
  case $arg in
    n) venv_name=$OPTARG;;
    a) activate=false;;
  esac
done


echo "creating venv at ${PWD}"

echo "..."

python -m venv ./$venv_name

if [ $? -eq 0 ]
then
    echo "venv created."
else
    echo "something went wrong creating the venv"
    exit
fi

if $activate
then
    echo "Activating the virtual environment..."
    sleep 1
    activate_path="./$venv_name/bin/activate"

    if [ -f "$activate_path" ]; then
        echo "Activating using $activate_path"
        source "$activate_path"
    else
        echo "Virtual environment activation script not found at $activate_path"
        echo "Please verify the virtual environment creation process."
        exit 1
    fi
fi
