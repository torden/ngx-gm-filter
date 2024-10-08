ngx-gm-filter
=============

ngx-gm-filter - Another image filter based GraphicsMagick.

Status
======

This module is under active development and is production ready.


Version
=======

This document describes ngx-gm-filter [v0.2.1](https://github.com/torden/ngx-gm-filter/tags).


Synopsis
========

```
server {
    gm_buffer 10M;

    location /gm {
         alias imgs;

         set $resize 100x100>;
         set $rotate 180;

         gm convert -resize $resize -rotate $rotate;
         gm composite -gravity SouthEast -min-width 200 -min-height 200 wm.png;

         gm_image_quality 85;
    }
}
```

Description
===========

Directives
==========

gm_buffer
--------------
**syntax:** *gm_buffer size*

**default:** *gm_buffer 4M*

**context:** *server, location*


gm_image_quality
--------------
**syntax:** *gm_image_quality quality*

**default:** *gm_image_quality 75*

**context:** *server, location*

gm
--------------
**syntax:** *gm_[resize|crop|rotate|composite]_ options*

**default:** *none*

**context:** *location*

gm_style
--------------
**syntax:** *gm_style style*

**default:** *none*

**context:** *location*

The *style* is the combine of gm commands, similar to nginx command flag "-g".

gm samples
--------------

```
gm resize 100x200!
gm resize 100x200
```


Installation
============

Install GraphicsMagick
------------

Install GraphicsMagick with jpeg and png

```bash
#Visit to https://sourceforge.net/projects/graphicsmagick/files/graphicsmagick/

tar xzvf GraphicsMagick-1.3.xx.tar.gz
cd GraphicsMagick-1.3.xx
./configure --with-x=no --with-jpeg=yes --with-png=yes
make
make install
```

Install ngx-gm-filter
------------

Build the source with this module:
```
git clone https://github.com/torden/ngx-gm-filter
cd ngx-gm-filter


./init.sh

wget 'http://nginx.org/download/nginx-1.27.1.tar.gz'
tar -xzvf nginx-1.27.1.tar.gz
cd nginx-1.27.1/


# Static Module
./configure --prefix=/opt/nginx \
--add-module=path/to/ngx-gm-filter

# Dynamic Module
./configure --prefix=/opt/nginx \
--add-dynamic-module=path/to/ngx-gm-filter


make -j2
sudo make install
```

Copyright and License
=====================

This module is licensed under the BSD license.

Copyright (C) 2009-2012, by "liseen" Xunxin Wan(万珣新) <liseen.wan@gmail.com>.

All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


See Also
========

* [GraphicsMagick](http://www.graphicsmagick.org/)  GraphicsMagick library.
* [HttpImageFilterModule](http://wiki.nginx.org/HttpImageFilterModule) .
