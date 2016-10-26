Part1:

%%dataset文件夹：准备训练数据的数据和代码
  1、digit_segment.m：对训练用的图片进行分割等预处理
  2、getlabel1_mnist.m：用mnist训练集训练得到的模型来预测digit01训练集的标签，其中
     loadMNISTImages.m/loadMNISTLabels.m:对mnist数据集进行预处理
  3、将digit01的标签集testResult1校正之后
     telnum_knn.m:用准确的digit01标签来训练digit02~digit09的标签
     digit01-size:90*784
     testResult1-size:90*1

  
Part2:训练
   telnum_training.m ：输入为digit01~digit09以及训练集testResult1~testResult9,输出为svm_struct


Part3:测试
   telnum_svm.m：测试图片，输入为训练好的模型svm_struct和一张测试图片，输出为识别得到的数字