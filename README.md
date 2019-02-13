### 1. Install vagrant

https://www.vagrantup.com/docs/installation/

*You may need virtualbox

### 2. Set up vagrant vm

```
$ git clone git@github.com:global-step/gauss-vagrant.git
$ cd gauss-vagrant
$ vagrant up
```

### 3. Set up Gauss app

```
$ vagrant ssh
$ git clone git@github.com:global-step/Gauss.git
$ cd Gauss
$ gem uninstall did_you_mean
$ bundle install
$ bundle exec rake db:migrate

# only first time
$ bundle exec rake db:seed
```

### 4. Run Gauss app (devlopment env)

```
# run elasticsearch
sudo /usr/share/elasticsearch/bin/elasticsearch -Des.insecure.allow.root=true & 

# async job
bundle exec rake jobs:work &
# for react 
# bundle exec bin/webpack-dev-server &

bundle exec rails s 
```
