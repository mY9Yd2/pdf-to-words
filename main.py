#!/usr/bin/env python3
#
# ISC License
#
# Copyright 2021 Kovács József Miklós <kovacsjozsef7u@gmail.com>
#
# Permission to use, copy, modify, and/or distribute this software for any purpose with or without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#

import re
import os


def processFile(fPath, fName):
    f = open(fPath + "/" + fName, "r", encoding="utf-8")
    lines = f.read(-1)
    f.close()

    allowed_chars = [
        "a", "á", "b", "c", "d", "e", "é", "f", "g", "h", "i", "í", "j", "k",
        "l", "m", "n", "o", "ó", "ö", "ő", "p", "q", "r", "s", "t", "u", "ú",
        "ü", "ű", "v", "w", "x", "y", "z", "A", "Á", "B", "C", "D", "E", "É",
        "F", "G", "H", "I", "Í", "J", "K", "L", "M", "N", "O", "Ó", "Ö", "Ő",
        "P", "Q", "R", "S", "T", "U", "Ú", "Ü", "Ű", "V", "W", "X", "Y", "Z"
    ]

    output = ""

    # remove all not allowed chars
    for char in lines:
        if char in allowed_chars:
            output += char
        else:
            output += " "

    # replace multiple spaces with a single space
    # and transform all word to lowercase
    # and convert to array
    output = re.sub("\s+", " ", output).lower().split()

    # sort by lenght
    output = sorted(output, key=lambda x: (-len(x), x))

    # remove 1 lenght "words"
    output = [d for d in output if len(d) > 1]

    # dedup
    output = {d: None for d in output}.keys()

    #print(output)
    with open("./output/" + fName, "w", encoding="utf-8") as of:
        of.write('\n'.join(output))


def main():

    mPath = "./raw-text"
    files = os.listdir(mPath)

    for file in files:
        if os.path.isfile(os.path.join(mPath, file)):
            processFile(mPath, file)


if __name__ == "__main__":
    main()
