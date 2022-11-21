#include <stdio.h>
#include <math.h>

void add_one(int *i) {
    int tmp = 1;
    *i += tmp;
}

int main() {
    double x, an = 1, S = 1;
    scanf("%lf", &x);
    printf("cos(%lf) = ", x);
    x = x - (int) (x / 2 / M_PI) * 2 * M_PI;
    for (int i = 1; fabs(an / S) > 0.001; add_one(&i)) {
        an *= -x * x / (2 * i * (2 * i - 1));
        S += an;
    }
    printf("%lf\n", S);
    return 0;
}

