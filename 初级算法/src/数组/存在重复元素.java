package 数组;

/*
给你一个整数数组 nums 。如果任一值在数组中出现 至少两次 ，返回 true ；如果数组中每个元素互不相同，返回 false 。
 
示例 1：
输入：nums = [1,2,3,1]
输出：true

示例 2：
输入：nums = [1,2,3,4]
输出：false

示例 3：
输入：nums = [1,1,1,3,3,4,3,2,4,2]
输出：true
*/

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class 存在重复元素 {

    //使用Set集合
    public boolean containsDuplicate(int[] nums) {
        Set<Integer> set = new HashSet<>();
        for(int i = 0;i < nums.length;i++) {
            if(set.contains(nums[i])) return true;
            set.add(nums[i]);
        }
        return false;
    }

    //先排序在进行比较
    public boolean containsDuplicateTwo(int[] nums) {
        Arrays.sort(nums);
        for (int ind = 1; ind < nums.length; ind++) {
            if (nums[ind] == nums[ind - 1]) {
                return true;
            }
        }
        return false;
    }


}
