Part1:

%%dataset�ļ��У�׼��ѵ�����ݵ����ݺʹ���
  1��digit_segment.m����ѵ���õ�ͼƬ���зָ��Ԥ����
  2��getlabel1_mnist.m����mnistѵ����ѵ���õ���ģ����Ԥ��digit01ѵ�����ı�ǩ������
     loadMNISTImages.m/loadMNISTLabels.m:��mnist���ݼ�����Ԥ����
  3����digit01�ı�ǩ��testResult1У��֮��
     telnum_knn.m:��׼ȷ��digit01��ǩ��ѵ��digit02~digit09�ı�ǩ
     digit01-size:90*784
     testResult1-size:90*1

  
Part2:ѵ��
   telnum_training.m ������Ϊdigit01~digit09�Լ�ѵ����testResult1~testResult9,���Ϊsvm_struct


Part3:����
   telnum_svm.m������ͼƬ������Ϊѵ���õ�ģ��svm_struct��һ�Ų���ͼƬ�����Ϊʶ��õ�������