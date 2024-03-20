#include <unity.h>
#include <coolCalculator.h>

void test_logic_add(void)
{
    TEST_ASSERT_EQUAL(5, add(2, 3));
    TEST_ASSERT_NOT_EQUAL(5, add(2, 2));
    TEST_ASSERT_EQUAL(-5, add(-10, 5));
}

void test_logic_subtract(void)
{
    TEST_ASSERT_EQUAL(5, subtract(10, 5));
    TEST_ASSERT_NOT_EQUAL(5, subtract(10, 4));
    TEST_ASSERT_EQUAL(-5, subtract(-10, -5));
}

void test_logic_multiply(void)
{
    TEST_ASSERT_EQUAL(6, multiply(2, 3));
    TEST_ASSERT_NOT_EQUAL(6, multiply(2, 2));
    TEST_ASSERT_EQUAL(-6, multiply(-2, 3));
}

void test_logic_divide(void)
{
    TEST_ASSERT_EQUAL(2, divide(6, 3));
    TEST_ASSERT_NOT_EQUAL(2, divide(6, 2));
    TEST_ASSERT_EQUAL(0, divide(0, 3));
}

void setUp() 
{
  // Run before all tests
}

void tearDown() 
{
  // Run after all tests
}

int main(void) 
{
    UNITY_BEGIN();
    RUN_TEST(test_logic_add);
    RUN_TEST(test_logic_subtract);
    RUN_TEST(test_logic_multiply);
    RUN_TEST(test_logic_divide);
    return UNITY_END();
}
