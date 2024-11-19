class Solution {
public:
    int addDigits(int num) {
        // int c = n;
        again:
        long long int sum = 0;
        while(num > 0) {
            long long int rem = num % 10;
            sum += rem;
            num /= 10;
        }
        if(sum < 10) return sum;
        else {
            num = sum;
            goto again;
        }
        return sum;
    }
};