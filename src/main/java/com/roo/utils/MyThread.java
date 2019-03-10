package com.roo.utils;

public class MyThread{

	public static void main(String[] s) {
//		f3();
		
int[] a = {0,1,2,3,4,5,6,7,8,9};
		
		int a_length = a.length;
		int a_rest = a_length % 4;
		
		int a_sort = 0 == a_length ? 0 : (0 == a_rest ? a_length / 4:a_length / 4 + 1); 
		
		
		/*for(int i=0;i<a.length;i++) {
			for(int k= 0;k < a_sort;k++) {
				int b[] = new int[4]; 
				for(int j = 0;j<4;j++) {
					b[j] = a[i];
				}
				System.out.println("the number of"+ k +"is:"+b);
			}
			
		}*/
		
		
		for(int k= 0;k < a_sort;k++) {
			int b[] = new int[4]; 
			if(k != a_sort-1) {
				for(int j = 0,i=k*4;j<4;i++,j++) {
					b[j] = a[i];
				}
			}else {
				for(int j = 0,i=k*4;j<a_rest;i++,j++) {
					b[j] = a[i];
				}
			}
			
			
			System.out.println("the number of"+ k +"is:"+b.toString());
		}
		
		
	}
	
	/*public static void f1() {
		System.out.println("方法1线程："+Thread.currentThread().getName()); 
		
		int[] a = {0,1,2,3,4,5,6,7,8,9};
		
		int a_length = a.length;
		int a_rest = a_length % 4;
		
		int a_sort = 0 == a_length ? 0 : (0 == a_rest ? a_length / 4:a_length / 4 + 1); 
		
		
		for(int i=0;i<a.length;i++) {
			for(int k= 0;k < a_sort;k++) {
				int b[] = new int[4]; 
				for(int j = 0;j<4;j++) {
					b[j] = a[i];
				}
				System.out.println("the number of"+ k +"is:"+b);
			}
			
		}
		
		
		
		
		
	}*/
	
	public static void f2() {
		System.out.println("方法2线程："+Thread.currentThread().getName()); 
	}
	
	public static void f3() {
		System.out.println("方法3线程："+Thread.currentThread().getName()); 
//		f1();
		f2();
	}
}
