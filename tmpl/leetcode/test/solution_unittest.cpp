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

TEST_F(SolutionTest, xxx) {
    Solution slt;
    EXPECT_EQ();
}
