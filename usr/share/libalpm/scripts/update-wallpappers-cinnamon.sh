#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# shellcheck shell=bash disable=SC1091,SC2039,SC2166
#
#  /usr/share/libalpm/scripts/update-wallpappers-cinnamon.sh
#  Created: 2024/11/22 - 13:30
#  Altered: 2024/11/22 - 13:30
#
#  Copyright (c) 2024-2024, Vilmar Catafesta <vcatafesta@gmail.com>
#  All rights reserved.
#
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions
#  are met:
#  1. Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
#  2. Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in the
#     documentation and/or other materials provided with the distribution.
#
#  THIS SOFTWARE IS PROVIDED BY THE AUTHOR AS IS'' AND ANY EXPRESS OR
#  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
#  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
#  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
#  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
#  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
#  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
#  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
#  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
##############################################################################

# Update the wallpapers whenever a wallpaper package is installed and includes it in Cinnamon
echo '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
<wallpapers>' > /usr/share/gnome-background-properties/chililinux-cinnamon.xml

shopt -s nocasematch
for img in /usr/share/backgrounds/chililinux/*; do
    if [[ $img =~ \.(jpg|jpeg|png|bmp|avif|webp|tiff)$ ]]; then
        name=${img##/}
        name=${name##*/}
        name=${name%%.*}
        name=${name^}
echo "<wallpaper>
<name>$name</name>
<filename>$img</filename>
<options>zoom</options>
</wallpaper>" >> /usr/share/gnome-background-properties/chililinux-cinnamon.xml
    fi
done
shopt -u nocasematch

echo '</wallpapers>' >> /usr/share/gnome-background-properties/chililinux-cinnamon.xml
