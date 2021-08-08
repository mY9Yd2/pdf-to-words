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

find raw-text/ -name '*.txt' | while read -r line; do
    # raw-text/foobar.txt --> output/foobar.txt
    newFilename=$(echo "$line" | sed 's/raw-text\//output\//g')

    sed 'y/AÁBCDEÉFGHIÍJKLMNOÓÖŐPQRSTUÚÜŰVWXYZ/aábcdeéfghiíjklmnoóöőpqrstuúüűvwxyz/' < "$line" | sed 's/[^aábcdeéfghiíjklmnoóöőpqrstuúüűvwxyz]/ /g' | sed ':a;N;$!ba;s/\n/ /g' | tr -s '[:space:]' | tr '[:space:]' '\n' | grep .. | sort | uniq -u > "$newFilename"

    # lets see

    # uppercase --> lowercase
    # sed 'y/AÁBCDEÉFGHIÍJKLMNOÓÖŐPQRSTUÚÜŰVWXYZ/aábcdeéfghiíjklmnoóöőpqrstuúüűvwxyz/' < "$line"

    # replace all not allowed character with a space
    # sed 's/[^aábcdeéfghiíjklmnoóöőpqrstuúüűvwxyz]/ /g'

    # transform all new line character to space
    # sed ':a;N;$!ba;s/\n/ /g'

    # multiple space to single space
    # tr -s '[:space:]'

    # convert space to newline
    # tr '[:space:]' '\n'

    # remove words that shorten than 2 character
    # grep ..
done
