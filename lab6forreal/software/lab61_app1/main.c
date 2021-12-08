
int main()
{
	int i = 0;
	volatile unsigned int *LED_PIO = (unsigned int*)0x60; //make a pointer to access the PIO block
	volatile unsigned char *SW_PIO = (unsigned char*)0x40;
	volatile unsigned char *KEY0 = (unsigned char*)0x30;
	volatile unsigned char *KEY1 = (unsigned char*)0x20;
	*LED_PIO = 0; //clear all LEDs
	char acc_flag = 0;
	int accumulator = 0;
	while ( (1+1) != 3) //infinite loop
	{
		if(!(*KEY0)){
			accumulator = 0;
		}
		if(!(*KEY1)&& !acc_flag){
			acc_flag = 1;
			if((accumulator + (*SW_PIO & 0x00FF)) > 255){
				accumulator = 0;
			}
			else{
				accumulator += (*SW_PIO & 0x00FF);
			}
		}
		if(*KEY1){
			acc_flag = 0;
		}
		*LED_PIO = (accumulator & 0x00FF);
//		for (i = 0; i < 100000; i++); //software delay
//			*LED_PIO = 1; //set LSB
//		for (i = 0; i < 100000; i++); //software delay
//			*LED_PIO = 0x0; //clear LSB
	}
	return 1; //never gets here
}
