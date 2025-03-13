package be.thebeehive.cicd.demo.fib;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;

class FibonacciTest {

    private FibonacciController controller = new FibonacciController();

    @Test
    void getNumbersZero()
    {
        int[] result = controller.getNumbers(0);
        assertThat(result).isEmpty();
    }

    @Test
    void getNumbersOne()
    {
        int[] result = controller.getNumbers(1);
        assertThat(result).containsExactly(0);
    }

    @Test
    void getNumbersTwo()
    {
        int[] result = controller.getNumbers(2);
        assertThat(result).containsExactly(0, 1);
    }

    @Test
    void getNumbersMore()
    {
        int[] result = controller.getNumbers(11);
        assertThat(result).containsExactly(0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55);
    }
}