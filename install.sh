sudo apt-get install libpcre3-dev libssl-dev libgd2-xpm-dev zlibc \
                     zlib1g zlib1g-dev
sudo adduser --system --no-create-home --disabled-login \
             --disabled-password --group nginx

cd nginx-1.5.8
./configure --prefix=/opt/nginx --user=nginx \
    --with-http_image_filter_module \
    --add-module=../redis-nginx-module-0.3.7 \
    --with-http_ssl_module \
    --add-module=../ngx_devel_kit-0.2.19 \
    --add-module=../set-misc-nginx-module-0.23

make
sudo make install
cd ..
sudo mkdir /opt/nginx/conf/sites-enabled
sudo cp nginx.conf /opt/nginx/conf/nginx.conf