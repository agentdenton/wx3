#include <zephyr/kernel.h>
#include <zephyr/drivers/gpio.h>

void main(void)
{
    for (;;) {
        printk("Hello World! %s\n", CONFIG_BOARD);
        k_sleep(K_MSEC(500));
    }
}
