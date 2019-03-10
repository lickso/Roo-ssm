package com.roo.utils.test;

import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.configuration.ConfigurationException;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.parser.ParseContext;
import com.jcraft.jsch.jce.MD5;
import com.roo.ssm.bean.Order_Product;
import com.roo.utils.RooCommonException;


class Dog{  
    int size;     
    public Dog(int s){  
        size = s;  
    }  
}  
  
class User implements Cloneable{  
    String name;     
    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public User(String name){  
    	this.name = name;  
    } 
    
    @Override  
    public Object clone() throws CloneNotSupportedException {  
    	
    	
    	
       /* double       data2 = this.data2;  
        String       data3 = new String(this.data3);  
        StringBuffer data4 = new StringBuffer(this.data4.toString());  
          
        CloneableClass copy = new CloneableClass(data1, data2, data3, data4);  */ 
        
    	String name = this.name;
    	
        return new User(name);  
    	
        //return super.clone();  
    }
}

class DogSizeComparator implements Comparator<Dog>{

	public int compare(Dog o1, Dog o2) {
		// TODO Auto-generated method stub
		return o2.size - o1.size;
	}  
   
    /*public int compare(Dog o1, Dog o2) {  
        return o1.size - o2.size;  
    }  */
	}  




public class test {
	
	public static void main(String[] args){
		/*System.out.println(RooCommonUtils.getPropertiesKeyList("C:/Users/yangsheng/Desktop/system.properties").toString());*/
		/*String url = "http://localhost:8080/roocore/user/add.action";
		url=url.replace("http://",""); 
		String[] node = url.split("/");
		
		url =  node[node.length-2] + "/" + node[node.length-1];
		System.out.println(url);*/
		
		/*int second = Integer.parseInt("19");
		second = second - (int)(second * 0.05);
		System.out.println(second);*/
		
		/*int i=0;
        if(10==10&(++i)==1){
        	System.out.print("结果     "+ String.valueOf(5&18));
        }else{
            System.out.print("结果为假     "+i);
        }*/
		
		
		/*List<String> strings = Arrays.asList("6", "1", "3", "1","2");

        Collections.sort(strings);//sort方法在这里

        for (String string : strings) {

            System.out.println(string);
        }*/
		
		
		
		/*User user = new User("");
		user.setName("original");
		
		User copy = (User) user.clone();
		
		System.out.println("copy :"+copy.getName());
		
		user.name = "modify";
		
//		System.out.println("copy :"+user.getName());
		System.out.println("copy :"+copy.getName());
		System.out.println("user :"+user.getName());*/
		
//		System.out.println("copy after user:"+user.getName());
		
		
		
		//定义第一个数组  
        /*int[] arr=new int[3];  
        arr[0]=10;  
        arr[1]=20;  
        arr[2]=70;  
        System.out.println(arr);  
        System.out.println(arr[0]);  
        System.out.println(arr[1]);  
        System.out.println(arr[2]);  
        System.out.println("--------------");  */
          
        //定义第二个数组  
        /*int[] arr2=new int[3];  
        arr2[0]=30;  
        arr2[1]=40;  
        System.out.println(arr2);  
        System.out.println(arr2[0]);  
        System.out.println(arr2[1]);  
        System.out.println("--------------");  */
          
        //定义第三个数组  
       /* int[] arr3=arr2;  
        arr3[0]=100;  
        arr3[1]=200;  
        arr3[2]=300;  
        System.out.println(arr3);  
        System.out.println(arr3[0]);  
        System.out.println(arr3[1]);  
        System.out.println(arr3[2]); */
		
		/*String[] offerIdSet = {"101040001007","101040001009","101040001008","101040001006"};
		List<Map<String,Object>> offerList = new ArrayList<Map<String,Object>>();
		for(String offerId : offerIdSet) {
			Map<String,Object> offerInfo = new HashMap<String,Object>();
			Map<String,Object> offerInfoIn = new HashMap<String,Object>();
			offerInfoIn.put("OFFER_ID", offerId);
			offerInfo.put("OFFER_INFO", offerInfoIn);
			offerList.add(offerInfo);
		}
        
		System.out.println(offerList);*/
		
		/*Date date = new Date();
		SimpleDateFormat CeshiFmt2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println(CeshiFmt2.format(date));*/
		
		
		/*JSONObject h = new JSONObject();
		
		JSONObject respOutJson = new JSONObject();
		respOutJson.put("jj", new HashMap<String,Object>());
		System.out.println(respOutJson.getString("jj"));
		System.out.println(respOutJson.getObject("jj", Map.class).get("j"));
		
		try {
			int j = 1/0;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			try {
				System.out.println("get error and throw");
				throw new RooCommonException();
			} catch (RooCommonException e1) {
				// TODO Auto-generated catch block
				System.out.println("throw after catch");
			}
		}*/
		
		Integer u=100,h=100;
		Integer i = 150,j=150;
		if(i==j) {
			System.out.println("hello true!");
		}else {
			System.out.println(Math.round(-11.6));
		}
		
//		System.out.println(Math.round(3<<4));
		
		
		int[]  jq = {1,2,0};
		//length属性
		System.out.println(jq.length);
		
		String kk = "jakkj";
		/*System.out.println(kk.length());*/
		
		String a = "aa";
		
		String c = new String("aa");
		
		
		String b = "a"+"a";
		System.out.println(a == b);
		System.out.println(a == c);
		System.out.println(a == a.intern());
		
		System.out.println(Integer.valueOf("02")+1);
		System.out.println(Integer.parseInt("12")+1);
		
		String s1 = "nihao";
		String s2 = new String();
		
		
		System.out.println("--------");
		Calendar calendar = Calendar.getInstance();
		System.out.println(calendar.get(Calendar.YEAR));
		System.out.println(calendar.get(Calendar.MONTH));
		
		
		System.out.println(Calendar.getInstance().getTimeInMillis());
		long aaa = Calendar.getInstance().getTimeInMillis();
		
		
		
		for(int ij=0;ij<10000000;ij++) {
			
		}
		
		
		
		assert(0==22);
		
		long bbb = Calendar.getInstance().getTimeInMillis();
		System.out.println(bbb-aaa);
		
		
		System.out.println(System.currentTimeMillis());

		
	    calendar.add(Calendar.DATE , -1);
	    System.out.println(calendar.getTime());
	    
	    
	    assert (12 < 0);
	    
//	    finalize kk
	    
		
//		System.out.println(calendar.MONTH);
		
		
		
		
				
//				e1.printStackTrace();
			
//			e.printStackTrace();
		
		
//		int hh = 1/0;
	    
	    
	    
	    
	    try {
	    	throw new ExceptionB();
	    }/*catch (ExceptionB e) {
	    	System.out.println("b");
	    }*//*catch (ExceptionA e) {
	    	System.out.println("a");
	    }*/catch (Exception ar) {
	    	System.out.println("e");
	    }
	    
	    
	    //反射机制
	    Class cla1 = new jk().getClass();
	    try {
			Class cla2 = Class.forName("com.roo.utils.test.jk");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    Class cla3 = jk.class;
	    
//	    cla1.getDeclaredMethod("", j);
	    
	    
	    try {
			Field  k = cla3.getDeclaredField("k");
			k.setAccessible(true);
		} catch (NoSuchFieldException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SecurityException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	    
	    
	    //构造器
	    try {
	    	
	    	//通过反射获取实例的方法，1.实例newInstance方法，2.构造器newInstance方法
			Constructor cons= cla1.getConstructor();
			jk jk1 = jk.class.newInstance();
			jk jk= (jk) cons.newInstance();
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
//	    Singleton instance;
	    
	    Singleton instance = Singleton.getInstance();
	    
	    Singleton instance1 = Singleton.getInstance();
	    
	    
	    
	    System.out.println(instance == instance1);
	    
	    
	    int[] pop = {2,1,5,4,3,0,4,7,8,9,1,5,2}; 
	    
	    //气泡排序
	    /*for(int l = 0;l<pop.length;l++) {
	    	for(int m = 1;m<pop.length - l;m++) {
	    		if(pop[m]>pop[m-1]) {
	    			int tmp = pop[m];
	    			pop[m] = pop[m-1];
	    			pop[m-1] = tmp;
	    		}
	    	}
	    }*/
	   
	    
	    
	    //折半查找
	    for(int n=1;n<pop.length;n++)
	    {
	    	
	    	
	    	
	    	
	        int tempData=pop[n];
	        int low=0;
	        int high=n-1;
	        while(low<=high)
	        {
	            int middle=(low+high)/2;
	            if(pop[middle]<tempData)
	            {
	                low=middle+1;
	            }
	            else
	            {
	                high=middle-1;
	            }
	             
	        }
//	        System.arraycopy(pop,low,pop,low+1,i-low);
	        pop[low]=tempData;
	     }
	    
	    for(int he : pop) {
	    	System.out.println(he);
	    }
	    
	    
	    
	    JSONArray jsonArray = new JSONArray();
		jsonArray.add("1");
		jsonArray.add("1");
		
		System.out.println("json's length is :"+jsonArray.size());
		
		
		
		
		
		
		
	    
	}
	
	Collections c ;
	
	
	
	
	/*public <T> List<T> asList(T... a) {
        return new ArrayList<>(a);
    }
	*/
	
	 /*public static void main(String[] args) {  
	        Dog d1 = new Dog(2);  
	        Dog d2 = new Dog(1);  
	        Dog d3 = new Dog(3);  
	   
	        Dog[] dogArray = {d1, d2, d3};  
	        printDogs(dogArray);  
	   
	        Arrays.sort(dogArray, new DogSizeComparator());   
	        printDogs(dogArray);  
	    }  
	   
	    public static void printDogs(Dog[] dogs){  
	        for(Dog d: dogs)  
	            System.out.print(d.size + " " );  
	   
	        System.out.println();  
	    }  */
	
	
//	Map<String,Object> j = new HashMap<String,Object>();
	
//	List<Map<String,Object>> k = new ArrayList<Map<String,Object>>();
	
//	k = (List<Map<String, Object>>) j.get("k");
	
	/*System.out.print(k.size + " ");  */
	
	
	
	/*String sdd = getMD5("");*/

}
