###telnum-Recognizer:识别图片上的机械数字（电话号码）
---------------------
Part1 准备训练集
> 用Mnist数据集做训练集得到的准确率较低，因此直接自制一个数据集，使用word中的各种字体截图得到图片，然后需要进行数据处理和转换，最后加上标签。

*  [dataset文件夹](https://github.com/JU-Chang/telnum-Recognizer/tree/master/dataset)：准备训练数据的数据和代码
	* [digit_segment.m](https://github.com/JU-Chang/telnum-Recognizer/blob/master/dataset/digit_segment.m)：对训练用的图片进行分割等预处理
	* [getlabel1_mnist.m](https://github.com/JU-Chang/telnum-Recognizer/blob/master/dataset/getlabel1_mnist.m)：用mnist训练集训练得到的模型来预测digit01训练集的标签，其中 [loadMNISTImages.m](https://github.com/JU-Chang/telnum-Recognizer/blob/master/dataset/loadMNISTImages.m)/[loadMNISTLabels.m](https://github.com/JU-Chang/telnum-Recognizer/blob/master/dataset/loadMNISTLabels.m):对mnist数据集进行预处理 
	将digit01的标签集testResult1校正之后
 * [telnum_knn.m](https://github.com/JU-Chang/telnum-Recognizer/blob/master/dataset/telnum_knn.m):用准确的digit01标签来训练digit02~digit09的标签 digit01-size:90784 testResult1-size:901

Part2:训练 
> 用part1得到的数据集训练一个svm模型

* [telnum_training.m](https://github.com/JU-Chang/telnum-Recognizer/blob/master/telnum_training.m) ：输入为digit01~digit09以及训练集testResult1~testResult9,输出为svm_struct

Part3:测试
 
* [telnum_svm.m](https://github.com/JU-Chang/telnum-Recognizer/blob/master/telnum_svm.m)：测试图片，输入为训练好的模型svm_struct和一张测试图片，输出为识别得到的数字
