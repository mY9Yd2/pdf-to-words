### Usage
Install `poppler-utils` with your package manager.
```bash
$ mkdir pdf raw-text output
```
Put your PDF files in `pdf/` then:
```bash
$ ./pdfToText.sh
$ ./main.py
```
### Contributing
Please use `editorconfig` and `yapf`.
```bash
$ yapf --style pep8 --in-place main.py
```
