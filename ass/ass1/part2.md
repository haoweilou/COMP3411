/*HaoweiLou, z5258575, assignment1-part2*/
Part2
a)
 ____________________________________________
|    |start10|start12|start20|start30|start40|
|____|_______|_______|_______|_______|_______|
|UCS |2565   |Mem    |Mem    |Mem    |Mem    |
|IDS |2407   |13812  |5297410|Time   |Time   |
|A   |33     |26     |915    |Mem    |Mem    |
|IDA |29     |21     |952    |17297  |112571 |
|____________________________________________|
b)
The Uniform Cost Search with Dijkstra’s Algorithm has least efficieny in memory usage, since it does not work when the minimum number of moves is larger than 12, it also takes the most time for computation.

The Iterative Deepening Search is more efficient in memory usage than the Uninformed Cost Search, since it can solve the problem up to start20 without runs out of memory. But it is not efficient in time since it takes too much time to solve start30 and start 40.

The A star search is much more efficient in memory usage compare to IDS and UCS alogrithem and comsume less time. But it still cannot solve start30 and start40 beacause of memory usage.

The Iterative Deepening A* Search is the most efficient alogrithem in these four, it can solve every problem without using all memories and need least time than others. 

In overall, Iterative method is helpful in reducing memory usages and A start search will increase the time efficiency.
