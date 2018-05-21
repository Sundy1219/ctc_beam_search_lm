此为百度第二代语音识别解码方案 CTC+BeamSearch+LM
===============================================

１　安装boost<br>
-------------
  1) 下载[boost_1_67_0.tar.gz](https://dl.bintray.com/boostorg/release/1.67.0/source/boost_1_67_0.tar.gz)<br>
  2) 解压 tar -xzvf boost_1_67_0.tar.gz<br>
  3) 进入 解压后的目录boost_1_67_0<br>
  4) ./bootstrap.sh<br>
  5) ./b2 perfix=/home/……(自己的安装目录)<br>
  
2 编译ctc_beam_search_decoder.cpp
---------------------------------
  将boost_1_67_0下的boost目录拷到ctc_beam_search_lm下，此项目已拷过了<br>
  ./compile_decoder.sh<br>
  
3 运行解码
----------
./ctc_beam_search_decoder
