#!bin/bash
bundle_temp_dir = "/home/ubuntu/bundles/umi4"
nginx_dir = "/var/www/example.umi4.com/"

if [ ! -d $bundle_path ]; then
    mkdirBundleTempDir $bundle_temp_dir
    sudo chown -R ubuntu:ubuntu $bundle_temp_dir
fi
moveBundleResources $bundle_temp_dir $nginx_dir

sudo ln -s /etc/nginx/sites-available/example.umi4.com /etc/nginx/sites-enabled
sudo nginx -t

# create a temporary directory
mkdirBundleTempDir() {
    sudo mkdir -p "$0"
}
# move the resources to the nginx directory
moveBundleResources() {
    sudo mv "$0" "$1"
}
