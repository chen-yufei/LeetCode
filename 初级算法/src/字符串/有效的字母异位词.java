package 字符串;

/*
给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。
注意：若 s 和 t 中每个字符出现的次数都相同，则称 s 和 t 互为字母异位词。

示例 1:
输入: s = "anagram", t = "nagaram"
输出: true

示例 2:
输入: s = "rat", t = "car"
输出: false

s 和 t 仅包含小写字母
**/

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

public class 有效的字母异位词 {

    public boolean isAnagram(String s, String t) {
        if(s.length() != t.length()) return false;
        Map<Character,Integer> map = new HashMap<>();
        for(int i = 0;i < s.length();i++) {
            map.put(s.charAt(i),map.getOrDefault(s.charAt(i),0) + 1);
        }
        for(int i = 0;i < t.length();i++) {
            map.put(t.charAt(i),map.getOrDefault(t.charAt(i),0) - 1);
        }
        for(Object key : map.keySet()) {
            if(map.get(key) != 0) return false;
        }
        return true;
    }

    public boolean isAnagramTwo(String s, String t) {
        if (s.length() != t.length())
            return false;
        int[] letterCount = new int[26];
        //统计字符串s中的每个字符的数量
        for (int i = 0; i < s.length(); i++)
            letterCount[s.charAt(i) - 'a']++;
        //减去字符串t中的每个字符的数量
        for (int i = 0; i < t.length(); i++) {
            //如果当前字符等于0，直接返回false，
            if (letterCount[t.charAt(i) - 'a'] == 0)
                return false;
            letterCount[t.charAt(i) - 'a']--;
        }
        return true;
    }

    //先排序在比较
    public boolean isAnagramThree(String s, String t) {
        char[] sChar = s.toCharArray();
        char[] tChar = t.toCharArray();
        //对两个字符串中的字符进行排序
        Arrays.sort(sChar);
        Arrays.sort(tChar);
        return Arrays.equals(sChar, tChar);
    }






}
