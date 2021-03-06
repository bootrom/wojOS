#define CHAR_SIZE (0x3 << 1)
#define UART_ENABLE (0x3 << 3)
#define BAUD_RATE_9600 0x33
#define UDR_EMPTY (1 << 5)
#define TX_FINISHED (1 << 6)

void uartInit();

int uartTx(char txByte, int blocking);
int uartRx(char rxByte, int blocking);
