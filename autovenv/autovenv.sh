venv_name="venv"
activate=true

show_help(){
    echo "
Emi's awsome pyhton venv creator!!!:
  -h | Show help
  -a | Dont activate the venv after being created
  -n | Sets venv name"
    exit
}

while getopts "n:ah" arg; do
  case $arg in
    h) show_help;;
    n) venv_name=$OPTARG;;
    a) activate=false;;
  esac
done

if [ "$#" -eq 0 ];
then
    show_help
fi

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
