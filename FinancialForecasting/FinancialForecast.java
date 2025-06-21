public class FinancialForecast {

    
    public static double calculateFutureValue(double currentValue, double growthRate, int years) {
        
        if (years == 0) {
            return currentValue;
        }

        
        return calculateFutureValue(currentValue, growthRate, years - 1) * (1 + growthRate);
    }

    public static void main(String[] args) {
        double currentValue = 10000;   
        double growthRate = 0.05;      
        int years = 5;                 

        double result = calculateFutureValue(currentValue, growthRate, years);

        System.out.printf("Future value after %d years: %.2f\n", years, result);
    }
}
