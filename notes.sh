#!/bin/bash
## Add a note to notes.md
usage() {
  echo "notes - write short notes to markdown files in ~/Documents/notes."
  echo "        The note can be a single line or multiline using stdin/heredoc syntax."
  echo "        If ~/Documents/notes doesn't exist, it is created."
  echo ""
  echo "Usage: notes [-h] [-f filename] text to write to notes file"
  echo "  -h              Display help text"
  echo "  -f filename     filename to write notes to in ~/Documents/notes folder ( default: notes.md )"
  echo ""
  echo " Examples:"
  echo " ** Single line note into sample.md **"
  echo "  notes -f sample.md the note I want to write"
  echo ""
  echo " ** pipe this function's help text into notes.md **"
  echo "  notes -h | notes"
  echo ""
  echo " ** Multiline example into default file **"
  echo "  notes<<NOTE"
  echo "  >this is a longer multiline note"
  echo "  >following heredoc syntax"
  echo "  >This example writes to the default file (notes.md)"
  echo "  >NOTE"
  echo ""
  echo " ** Multiline example with filename specified**"
  echo "  notes -f specific_file.md<<NOTE"
  echo "  >this is a longer multiline note"
  echo "  >following heredoc syntax"
  echo "  >This example writes to specific_file.md"
  echo "  >as the -f flag has been passed."
  echo "  >NOTE"
  return 0
}

notes() {
  local OPTIND OPTION f NOTEFILE NOTEDIR
  NOTEDIR="$HOME/Documents/notes"
  NOTEFILE="notes.md"
  while getopts "hf:" OPTION; do
    case $OPTION in
      h)
        usage      
        ;;
      f)
        NOTEFILE=$OPTARG
        shift $((OPTIND - 1))
        ;;
      \?)
        return 1
        ;;
    esac
  done

# If the note directory doesn't exist, create it
  if [ ! -d "$NOTEDIR" ]; then
    mkdir -p $NOTEDIR >> /dev/null
  fi

  if [ ! -z "$1" ]; then
    # Using the "$@" here will take all parameters passed into
    # this function so we can place everything into our file.
    echo "$@" >> "$NOTEDIR/$NOTEFILE"
  else
    # If no arguments were passed we will take stdin and place
    # it into our notes instead.
    cat - >> "$NOTEDIR/$NOTEFILE"
  fi
}

