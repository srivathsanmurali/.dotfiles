# xrandr
function addMonitor() {
  if [ -n "$1" ]
  then
    mon="$1"
  else
    mon=DP2
  fi
  if [ -n "$2" ]
  then
    dir="$2"
  else
    dir=--right-of
  fi
  if [ -n "$3" ]
  then
    refmon="$1"
  else
    refmon=eDP1
  fi
  xrandr --output $mon --auto $dir $refmon
}
function removeMonitor() {
  if [ -n "$1" ]
  then
    echo removing "$1"
    xrandr --output "$1" --off 
  else
    echo removing DP2
    xrandr --output DP2 --off 
    #echo 'specify output id'
  fi
}

function startWork() {
  echo "Adding monitor DP2-1"
  xrandr --output DP2-1 --auto --right-of eDP1
}
function stopWork() {
  echo "Removing monitor DP2-1"
  xrandr --output DP2-1 --off
}

function watchMarkdown() {
  if [ -n "$2" ]
  then
    out=$2
  else
    out="dev.pdf"
  fi
  if [ -n "$1" ]
  then
    echo "Watching $1 for changes and pandoc to $out"
    while true;
    do
      inotifywait -e modify $1;
      pandoc $1 -o $out -V geometry:margin=1in;
    done;
  else
    echo "Need input file"
  fi
}

# display time in multiple countries
function tz() {
  echo "local         " `date`
  echo "Zurich        " `TZ='Europe/Zurich' date`
  echo "Pacific       " `TZ='America/Vancouver' date`
  echo "Singapore     " `TZ='Asia/Singapore' date`
}

function sshReady() {
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
}

function precmd() {
  PSVAR=`git_prompt_precmd`
}
