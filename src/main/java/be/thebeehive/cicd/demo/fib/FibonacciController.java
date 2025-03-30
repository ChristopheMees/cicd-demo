package be.thebeehive.cicd.demo.fib;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/fib")
public class FibonacciController {

    @GetMapping
    public long[] getNumbers(@RequestParam("count") int count) {
        if (count == 0) return new long[0];
        if (count == 1) return new long[]{0};
        if (count == 2) return new long[]{0, 1};

        long[] arr = new long[count];
        arr[0] = 0;
        arr[1] = 1;

        for (int idx = 2;idx < count;idx++) {
            arr[idx] = arr[idx - 1] + arr[idx - 2];
        }
        return arr;
    }
}
