package 字符串;

/*
编写一个函数，其作用是将输入的字符串反转过来。输入字符串以字符数组 s 的形式给出。
不要给另外的数组分配额外的空间，你必须原地修改输入数组、使用 O(1) 的额外空间解决这一问题。

示例 1：
输入：s = ["h","e","l","l","o"]
输出：["o","l","l","e","h"]

示例 2：
输入：s = ["H","a","n","n","a","h"]
输出：["h","a","n","n","a","H"]
*/

public class 反转字符串 {

    public void reverseString(char[] s) {
        int length = s.length;
        char tmp = ' ';
        for(int i = 0;i < length / 2;i++) {
            tmp = s[i];
            s[i] = s[length-1-i];
            s[length-1-i] = tmp;
        }
    }

    //使用双指针
    public void reverseStringTwo(char[] s) {
        int length = s.length;
        //两个指针一个从第1个，一个从最后一个开始，
        //两两交换
        int left = 0;
        int right = length - 1;
        while (left < right) {
            swap(s, left++, right--);
        }
    }

    private void swap(char[] array, int i, int j) {
        char temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }

}
