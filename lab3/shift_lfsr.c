#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

unsigned int shift_lfsr(unsigned int v)
{
								/*
								   config          : fibonacci
								   length          : 16
								   taps            : (16, 15, 14, 5)
								   shift-amounts   : (1)
								   shift-direction : left
								 */
								enum {
																length         = 16,
																tap_0          = 16,
																tap_1          = 15,
																tap_2          = 14,
																tap_3          =  5,
																shift_amount_0 =  1
								};
								typedef unsigned int T;
								const T zero = (T)(0);
								v = (
																(
																								v << shift_amount_0
																) | (

																								(
																																(v >> (tap_0 - shift_amount_0)) ^
																																(v >> (tap_1 - shift_amount_0)) ^
																																(v >> (tap_2 - shift_amount_0)) ^
																																(v >> (tap_3 - shift_amount_0))
																								) & (
																																~(~zero << shift_amount_0)
																																)
																								)
																);
								return v;
}


#ifdef __cplusplus
} /* end of extern "C" */
#endif /* __cplusplus */





int main(void)
{
								const unsigned short init = 1;
								unsigned short v = init;
								int k=0;
								do {
																v = shift_lfsr(v);
																//putchar(((v & 1) == 0) ? '0' : '1');
																printf("%u\n",v);
								} while(k++<30); //while (v != init);
}
