此为百度第二代语音识别解码方案C++版本 CTC+BeamSearch+LM
===============================================

１ ctc_beam_search_decoder.cpp中相关的解码参数<br>
-------------
  1)  num_frames:为wav的帧数<br>
  2) num_classes:为分类的数目，比如建模单元为多少个汉字<br>
  3) beam_size:beam的大小<br>
  4) blank_id:ctc训练时,blank的id<br>
  5) cutoff_prob:为概率剪枝参数<br>
  6) alpha:为语言模型权重系数<br>
  7) beta:为句子长度系数<br>
  8) 输入:经声学模型后的softmax概率prob.txt,以及相应的字表vocab.txt<br>
  9) 输出:解码结果<br>

２ 编译ctc_beam_search_decoder.cpp<br>
---------------------------------
  1) 将boost_1_67_0下的boost目录拷到ctc_beam_search_lm下，此项目已拷过了,可直接用<br>
  2) 开始编译: ./compile_decoder.sh<br>

３ 运行解码<br>
----------
./ctc_beam_search_decoder

４ 解码结果
--------- 
![decode_result](https://github.com/Sundy1219/ctc_beam_search_lm/raw/master/result.png)
