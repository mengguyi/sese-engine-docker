SESE_DIR="sese-engine-building"
if [ -d "$SESE_DIR" ]; then
  echo "${SESE_DIR} exists, do not reclone"
else
    git clone https://ghproxy.com/https://github.com/RimoChan/sese-engine $SESE_DIR
    cd $SESE_DIR && cat requirements.txt | grep -v orjson | grep -v guppy3 > new_requirements.txt && echo orjson >> new_requirements.txt
    mv new_requirements.txt requirements.txt
    sed 's/loli_spider/Googlebot/g' 配置.py
    cd ..
fi
docker build . -t mengguyi/sese-engine
