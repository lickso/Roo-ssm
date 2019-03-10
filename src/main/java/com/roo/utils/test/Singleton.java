package com.roo.utils.test;

/*
 * 单例模式
 */
public class Singleton {
	private static Singleton instance = null;
	private int i = 0;
	private Singleton() {
		i++;
		System.out.println(i);
	}
	public static synchronized Singleton getInstance(){
        if (instance == null) instance = new Singleton();
        return instance;
    }
}
