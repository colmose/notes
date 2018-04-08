# notes

Simple bash script to write short notes to Markdown files from the command line.
Write notes on a single line or use stdin to pass longer multiline notes.

Writes to a default `notes.md` file but the file to write to can be specified.

Usage: 

```bash
  notes [-h] [-f filename] text to write to notes file
    -h              Display help text
    -f filename     filename to write notes to in ~/Documents/notes folder ( default: notes.md )
```

### Examples

** Single line note into sample.md **
```bash
  notes -f sample.md the note I want to write
```
  
** pipe this function's help text into notes.md **
```bash
  notes -h | notes
```
  
** Multiline example into default file **
```bash
notes<<NOTE
>this is a longer multiline note
>following heredoc syntax
>This example writes to the default file (notes.md)
>NOTE
```

** Multiline example with filename specified**
```bash
notes -f specific_file.md<<NOTE
>this is a longer multiline note
>following heredoc syntax
>This example writes to specific_file.md
>as the -f flag has been passed.
>NOTE
```

#### Not Windows compatible (filepath is hardcoded and UNIXy)!
