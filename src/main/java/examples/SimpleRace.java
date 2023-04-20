package examples;

public class SimpleRace {

    static int sharedVar;

    public static void main(String[] args) {
        var t = new ThreadRunner() {
            @Override
            public void thread1() {
                sharedVar++;
            }

            @Override
            public void thread2() {
                sharedVar++;
            }
        };
        System.out.println(t);
    }
}