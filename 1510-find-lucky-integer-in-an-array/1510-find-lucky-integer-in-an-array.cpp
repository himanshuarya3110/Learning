class Solution {
public:
    int findLucky(vector<int>& arr) {
        unordered_map<int,int> mp;
        for(auto &i:arr){
            mp[i]++;
        }
        int ans =-1, prev=0;
        for(auto &i:arr){
            if(mp[i]==i){
                prev = i;
                ans = max(ans,prev);
            }
        }

        return ans;
    }
};