### Info
Sadly, this program is currently not useful, total trash.
### Usage
Install `poppler-utils` with your package manager.
```bash
$ mkdir pdf raw-text output
```
Put your PDF files in `pdf/` then:
```bash
$ ./pdfToText.sh
$ ./textToWords.sh
```
Merge all output
```bash
$ ./merge.sh
```
### Contributing
Please use `editorconfig`, `shellcheck`.
```bash
$ shellcheck foobar.sh
```
