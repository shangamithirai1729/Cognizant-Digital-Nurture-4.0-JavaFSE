import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;

public class CalculatorTest {

    private Calculator calculator;

    @Before
    public void setUp() {
        calculator = new Calculator();
    }

    @After
    public void tearDown() {
        calculator = null;
    }

    @Test
    public void testAdd() {
        int a = 5;
        int b = 3;
        int result = calculator.add(a, b);
        assertEquals(8, result);
    }

    @Test
    public void testSubtract() {
        int a = 10;
        int b = 4;
        int result = calculator.subtract(a, b);
        assertEquals(6, result);
    }
}
