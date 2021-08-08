#!/usr/bin/env bash
#
# ISC License
# 
# Copyright 2021 Kovács József Miklós <kovacsjozsef7u@gmail.com>
# 
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
# 
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.
# 

if ! command -v pdftotext &> /dev/null
then
    echo "pdftotext could not be found"
    exit
fi

find pdf/ -name '*.pdf' | while read -r line; do
    # pdf/foobar.pdf --> raw-text/foobar.txt
    newFilename=$(echo "$line" | sed 's/pdf\//raw-text\//g' | sed 's/.pdf/.txt/g')

    pdftotext -layout "$line" "$newFilename"
done
