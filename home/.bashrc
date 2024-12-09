
alias nodeupdate='nvm install $(nvm current | sed -rn "s/v([[:digit:]]+).*/\1/p") --reinstall-packages-from=$(nvm current)'

touchp ()
{
  DIR=$(dirname $1)
  if [ "$DIR" != "." ]; then
    mkdir -p $DIR 
  fi

  touch $1
}
