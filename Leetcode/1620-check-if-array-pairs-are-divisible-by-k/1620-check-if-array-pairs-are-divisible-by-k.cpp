class Solution {
public:
    bool canArrange(vector<int>& arr, int k) {
        vector<int> freq(k, 0);  // Frequency of remainders
        
        // Count remainders
        for (int num : arr) {
            int rem = ((num % k) + k) % k;  // Normalize remainder
            freq[rem]++;
        }
        
        // Check pairs of remainders
        if (freq[0] % 2 != 0) return false;  // Numbers divisible by k must have even count
        
        // Loop through and check remainder pairs
        for (int i = 1; i <= k / 2; i++) {
            if (i == k - i) {  // Special case for remainder exactly half of k
                if (freq[i] % 2 != 0) return false;
            } else if (freq[i] != freq[k - i]) {
                return false;  // Remainder counts must match
            }
        }
        
        return true;
    }
};
