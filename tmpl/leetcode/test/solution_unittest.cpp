#include "gtest/gtest.h"
#include "solution.hpp"
#include <string>
using namespace std;
class SolutionTest: public ::testing::Test{
    protected:
        virtual void SetUp(){

        }

        virtual void TearDown(){

        }
};
int main(int argc, char **argv) {
      ::testing::InitGoogleTest(&argc, argv);
        return RUN_ALL_TESTS();

}

TEST_F(SolutionTest, hIndex) {
    Solution slt;
    vector<int> a1{3,0,6,1,5};
    EXPECT_EQ(3, slt.hIndex(a1));
}

TEST_F(SolutionTest, NoneTest) {
    Solution slt;
    vector<int> none_vec;
    EXPECT_EQ(0, slt.hIndex(none_vec));
}

TEST_F(SolutionTest, ZeroTest) {
    Solution slt;
    vector<int> zero_vec{0};
    EXPECT_EQ(0, slt.hIndex(zero_vec));
}

TEST_F(SolutionTest, lone1) {
    Solution slt;
    vector<int> lone1{1};
    EXPECT_EQ(1, slt.hIndex(lone1));
}
