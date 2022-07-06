ansible -b leaf11 -a "ln -s /etc/nginx/sites-{available,enabled}/nvue.conf"
ansible -b leaf12 -a "ln -s /etc/nginx/sites-{available,enabled}/nvue.conf"
ansible -b leaf21 -a "ln -s /etc/nginx/sites-{available,enabled}/nvue.conf"
ansible -b leaf22 -a "ln -s /etc/nginx/sites-{available,enabled}/nvue.conf"
ansible -b spine13 -a "ln -s /etc/nginx/sites-{available,enabled}/nvue.conf"
ansible -b spine14 -a "ln -s /etc/nginx/sites-{available,enabled}/nvue.conf"
ansible -b spine23 -a "ln -s /etc/nginx/sites-{available,enabled}/nvue.conf"
ansible -b spine24 -a "ln -s /etc/nginx/sites-{available,enabled}/nvue.conf"
ansible -b wan01 -a "ln -s /etc/nginx/sites-{available,enabled}/nvue.conf"
ansible -b wan02 -a "ln -s /etc/nginx/sites-{available,enabled}/nvue.conf"

ansible -b leaf11 -a "sudo sed -i 's/listen localhost:8765 ssl;/listen 0.0.0.0:8765 ssl;/g' /etc/nginx/sites-available/nvue.conf"
ansible -b leaf12 -a "sudo sed -i 's/listen localhost:8765 ssl;/listen 0.0.0.0:8765 ssl;/g' /etc/nginx/sites-available/nvue.conf"
ansible -b leaf21 -a "sudo sed -i 's/listen localhost:8765 ssl;/listen 0.0.0.0:8765 ssl;/g' /etc/nginx/sites-available/nvue.conf"
ansible -b leaf22 -a "sudo sed -i 's/listen localhost:8765 ssl;/listen 0.0.0.0:8765 ssl;/g' /etc/nginx/sites-available/nvue.conf"
ansible -b spine13 -a "sudo sed -i 's/listen localhost:8765 ssl;/listen 0.0.0.0:8765 ssl;/g' /etc/nginx/sites-available/nvue.conf"
ansible -b spine14 -a "sudo sed -i 's/listen localhost:8765 ssl;/listen 0.0.0.0:8765 ssl;/g' /etc/nginx/sites-available/nvue.conf"
ansible -b spine23 -a "sudo sed -i 's/listen localhost:8765 ssl;/listen 0.0.0.0:8765 ssl;/g' /etc/nginx/sites-available/nvue.conf"
ansible -b spine24 -a "sudo sed -i 's/listen localhost:8765 ssl;/listen 0.0.0.0:8765 ssl;/g' /etc/nginx/sites-available/nvue.conf"
ansible -b wan01 -a "sudo sed -i 's/listen localhost:8765 ssl;/listen 0.0.0.0:8765 ssl;/g' /etc/nginx/sites-available/nvue.conf"
ansible -b wan02 -a "sudo sed -i 's/listen localhost:8765 ssl;/listen 0.0.0.0:8765 ssl;/g' /etc/nginx/sites-available/nvue.conf"

ansible -b leaf11 -a "systemctl restart nginx"
ansible -b leaf12 -a "systemctl restart nginx"
ansible -b leaf21 -a "systemctl restart nginx"
ansible -b leaf22 -a "systemctl restart nginx"
ansible -b spine13 -a "systemctl restart nginx"
ansible -b spine14 -a "systemctl restart nginx"
ansible -b spine23 -a "systemctl restart nginx"
ansible -b spine24 -a "systemctl restart nginx"
ansible -b wan01 -a "systemctl restart nginx"
ansible -b wan02 -a "systemctl restart nginx"