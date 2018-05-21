此为百度第二代语音识别解码方案 CTC+BeamSearch+LM
===============================================

１　安装boost<br>
-------------
  1) 下载[boost_1_67_0.tar.gz](https://dl.bintray.com/boostorg/release/1.67.0/source/boost_1_67_0.tar.gz)<br>
  2) 解压 tar -xzvf boost_1_67_0.tar.gz<br>
  3) 进入 解压后的目录boost_1_67_0<br>
  4) ./bootstrap.sh<br>
  5) ./b2 perfix=/home/……(自己的安装目录)<br>

2 相关的解码参数<br>
-------------
  1)　num_frames:为wav的帧数<br>
  2)num_classes:为分类的数目，比如建模单元为多少个汉字<br>
  3)beam_size:beam的大小<br>
  4)blank_id:ctc训练时,blank的id<br>
  5)cutoff_prob:为概率剪枝参数<br>
  6)alpha:为语言模型权重系数<br>
  7)beta:为句子长度系数<br>
  8)输入:经声学模型后的softmax概率prob.txt,以及相应的字表vocab.txt<br>
  9)输出:解码结果<br>

3 编译ctc_beam_search_decoder.cpp<br>
---------------------------------
  将boost_1_67_0下的boost目录拷到ctc_beam_search_lm下，此项目已拷过了,可直接用<br>
  ./compile_decoder.sh<br>

4 运行解码<br>
----------
./ctc_beam_search_decoder
