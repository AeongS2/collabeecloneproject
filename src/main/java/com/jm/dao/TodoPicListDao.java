package com.jm.dao;

import java.util.ArrayList;
import java.util.Arrays;

public class TodoPicListDao {
	public ArrayList<Integer> TodoPicList(String pic_list, int member_id) {
		ArrayList<Integer> pic = new ArrayList<Integer>();
		if(pic_list==null) {
			pic.add(member_id);
			
			return pic;
		}else {
			
			String[] str = pic_list.split("_");
			
			for(int i = 0; i<str.length; i++) {
				pic.add( Integer.parseInt(str[i]) );
			}
			
			return pic;
		}
		
	}
}
