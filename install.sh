#!/bin/bash
echo simplesmente sera copiado os dois scripts pdftoosdividir e pdftoosmesclar para /usr/bin
cd scripts
sudo cp * /usr/bin/
sudo chmod +x /usr/bin/pdftoosdividir.sh
sudo chmod +x /usr/bin/pdftoosmesclar.sh