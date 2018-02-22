# Assignment 1

Details about this assignment can be found [on the course webpage](http://cs231n.github.io/), under Assignment #1 of Spring 2017.

```bash
# sudo pip install virtualenv
# virtualenv -p python3 .env
# source .env/bin/activate
pip install -r requirements.txt






cd cs231n/datasets
./get_datasets.sh

```

```bash
docker build --no-cache --compress --force-rm -t cs231n/assignment-1:$(date +'%Y%m%d%H%M%S') .
```
