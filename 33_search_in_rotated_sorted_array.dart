//* problem link: https://leetcode.com/problems/search-in-rotated-sorted-array

class Solution {
  int search(List<int> nums, int target) {
    int low = 0;
    int high = nums.length - 1;

    while (low <= high) {
      int mid = (low + high) ~/ 2;

      if (nums[mid] == target) {
        return mid;
      }

      if (nums[low] <= nums[mid]) {
        //  Left half is sorted
        if (target >= nums[low] && target < nums[mid]) {
          high = mid - 1; // Target is in the left half, adjust the high index
        } else {
          low = mid + 1; // Target is in the right half, adjust the low index
        }
      } else {
        // Right half is sorted
        if (target > nums[mid] && target <= nums[high]) {
          low = mid + 1; // Target is in the right half, adjust the low index
        } else {
          high = mid - 1; // Target is in the left half, adjust the high index
        }
      }
    }

    return -1;
  }
}
