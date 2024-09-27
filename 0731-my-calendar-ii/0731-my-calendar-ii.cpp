class MyCalendarTwo {
    using int2=pair<int, int>;
    vector<int2> S1, S2;
public:
    MyCalendarTwo() {
        S1.reserve(1000);
        S2.reserve(1000);
    }
    
    bool book(int start, int end) {
        for(auto& [s, t]: S2){
            if (max(s, start)<min(t, end))// overlap with S2
                return 0;
        }
        for (auto& [s, t]: S1){
            int s0=max(s, start), t0=min(t, end);
            if  (s0 < t0)// overlap with S1
                S2.emplace_back(s0, t0);//put into S2
        }
        S1.emplace_back(start, end);
        return 1;
    }
};

/*
Intuition

1st attempt uses 2 vectors S1, S2 to store the singled bookings, double bookings.
It needs time for each calling book O(n), slow.

Later try other approach!

Approach

1. In constructor reserve space for S1, S2
2. In book(int start, int end), use a loop to check whether the time interval [start, end) is overlapping with any [s, t) in S2; if yes return false.
3. Consider whether there are time intervals [s,t) in S1 which has non-empty intersection with [start, end). If yes, the overlapping part [s0, t0) would be appended to S2
4. the time interval [start, end) is appended to S1.
5. return true for not triple booking

Complexity

Time complexity:
Constructor: O(n)
book: O(n)
n operations: O(n^2)

Space complexity:
O(n)
*/

/**
 * Your MyCalendarTwo object will be instantiated and called as such:
 * MyCalendarTwo* obj = new MyCalendarTwo();
 * bool param_1 = obj->book(start,end);
 */