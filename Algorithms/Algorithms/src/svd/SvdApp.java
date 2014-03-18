package svd;

public class SvdApp {
	
	double lamda1 = 0.0;
	double lamda2 = 0.0;
	double eta = 0.1;
	double features;
	double fname;
	
	double[][] l = {
			{0, 3, 4, 5, 2},
			{3, 5, 2, 2, 5},
			{5, 3, 0, 3, 4},
			{5, 5, 5, 0, 4},
			{2, 3, 0, 2, 2}
	};
	
	
	double mu;
	double[] bu;
	double[] bv;
	double[][] uf;
	double dot(double[] v1, double[] v2){
		double res = 0;
		for (int i = 0; i < v1.length; i++){
			res += v1[i] * v2[i];
		}
		return res;
	}

	void init(){
		mu = 0;
		bu = new double[l.length];
		bv = new double[l[0].length];
		uf = new double[l.length][];
	}
	
	void train(){
		int iterNo = 0;
		double err = 0;
		double rmse = 1;
		double oldRmse = 0;
		double threshold = 0.01;
		double eps = 0.00001;
		while (Math.abs(oldRmse - rmse) > eps){
			oldRmse = rmse;
			rmse = 0;
			for (int u = 0; u < l.length; u++){
				for (int v= 0; v< l[u].length; v++){
					err = l[u][v];
				}
			}
		}
	}
}
