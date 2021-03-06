#include "key.h"
/****************************************************
 *
 *Function Name: KEY_Init()
 *
 *
**********************************************/
void KEY_Init(void)
{
   gpio_pin_config_t key_config = {
	  kGPIO_DigitalInput ,
	  0,
    };

   /* Port D Clock Gate Control: Clock enabled */
    CLOCK_EnableClock(kCLOCK_PortE);
    
    CLOCK_EnableClock(kCLOCK_PortA);
	 CLOCK_EnableClock(kCLOCK_PortC);

	//PORT_SetMultiplePinsConfig();

    /* PORTD0 (pin 93) is configured as PTD0, */
        PORT_SetPinMux(PORTE, 30U, kPORT_MuxAsGpio);
		PORT_SetPinMux(PORTE, 29U, kPORT_MuxAsGpio);
		PORT_SetPinMux(PORTE, 24U, kPORT_MuxAsGpio);
		PORT_SetPinMux(PORTE, 25U, kPORT_MuxAsGpio);

		/* PORTA (pin 93) is configured as PTD0, */
		PORT_SetPinMux(PORTA, 1U,  kPORT_MuxAsGpio);
		PORT_SetPinMux(PORTA, 2U,  kPORT_MuxAsGpio);
		PORT_SetPinMux(PORTA, 4U,  kPORT_MuxAsGpio);
		PORT_SetPinMux(PORTA, 5U,  kPORT_MuxAsGpio);
        PORT_SetPinMux(PORTA, 12U, kPORT_MuxAsGpio);
		PORT_SetPinMux(PORTA, 13U, kPORT_MuxAsGpio);

		PORT_SetPinMux(PORTC, 3U, kPORT_MuxAsGpio);
	

        GPIO_PinInit(BRAKE_KEY_GPIO,    BRAKE_KEY_GPIO_PIN, 		&key_config);
        GPIO_PinInit(START_KEY_GPIO,    START_KEY_GPIO_PIN, 		&key_config);
		GPIO_PinInit(DIR_GPIO,      	DIR_GPIO_PIN, 		    	&key_config);
		GPIO_PinInit(KEY4_GPIO,     	KEY4_GPIO_PIN, 		    	&key_config);
		GPIO_PinInit(KEY5_GPIO,     	KEY5_GPIO_PIN, 		    	&key_config);
		GPIO_PinInit(KEY6_GPIO,     	KEY6_GPIO_PIN, 		    	&key_config);
        GPIO_PinInit(KEY7_GPIO,     	KEY7_GPIO_PIN, 		    	&key_config);
		GPIO_PinInit(KEY8_GPIO,     	KEY8_GPIO_PIN, 		    	&key_config);
		GPIO_PinInit(KEY9_GPIO,     	KEY9_GPIO_PIN,   	    	&key_config);
		//GPIO_PinInit(AIR_GPIO,    	    AIR_GPIO_PIN, 	    	&key_config);
		GPIO_PinInit(ABC_POWER_GPIO,    ABC_POWER_GPIO_PIN, 	    &key_config);
        
        PORT_PinPullConfig(HW_GPIOE, 29,  kPORT_PullDown);
        PORT_PinPullConfig(HW_GPIOE, 30,  kPORT_PullDown);
        PORT_PinPullConfig(HW_GPIOE, 24,  kPORT_PullDown);
        PORT_PinPullConfig(HW_GPIOE, 25,  kPORT_PullDown);
        
        PORT_PinPullConfig(HW_GPIOA, 1,   kPORT_PullDown);
        PORT_PinPullConfig(HW_GPIOA, 2,   kPORT_PullDown);
        PORT_PinPullConfig(HW_GPIOA, 4,   kPORT_PullDown);
        PORT_PinPullConfig(HW_GPIOA, 5,   kPORT_PullDown);
        PORT_PinPullConfig(HW_GPIOA, 12,  kPORT_PullDown);
        PORT_PinPullConfig(HW_GPIOA, 13,  kPORT_PullDown);

		 PORT_PinPullConfig(HW_GPIOC, 3,  kPORT_PullDown);
		
                
     /* Brake_Key Init input interrupt switch GPIO. */
  #if (defined(FSL_FEATURE_PORT_HAS_NO_INTERRUPT) && FSL_FEATURE_PORT_HAS_NO_INTERRUPT)
   GPIO_SetPinInterruptConfig(BRAKE_KEY_GPIO , BRAKE_KEY_GPIO_PIN , kPORT_InterruptEitherEdge );
 
  #else
    PORT_SetPinInterruptConfig(BRAKE_KEY_PORT, BRAKE_KEY_GPIO_PIN,  kPORT_InterruptEitherEdge);

  #endif
    EnableIRQ(BRAKE_KEY_IRQ);
    GPIO_PinInit(BRAKE_KEY_GPIO, BRAKE_KEY_GPIO_PIN, &key_config);


     



}


/*************************************************************************************
    *
    * 按键扫描程序 
    * mode: 0 - 不支持连续按，1-支持连续按
    * 0，没有任何按键按下
    *，按下按键
    * 优先权 ：BRAKE>START_KEY>DIR_UP_KEY>DIGITAL_ADD_KEY>DIGITAL_REDUCE_RKEY>
    *
**************************************************************************************/
uint8_t KEY_Scan(uint8_t mode)
{
	   static uint8_t key_up = 1; //按键松开标志
	   if(mode == 1) key_up =1;
	  if(key_up &&(DIR_DOWN_KEY == 1 || START_KEY ==1 ||DIR_UP_KEY ==1 || DIGITAL_ADD_KEY==1||\
					DIGITAL_REDUCE_KEY==1||DOOR_KEY==1||HALL_SWITCH_KEY==1||\
					MOTOR_STOP_KEY==1|| WIPERS_KEY==1 ))
	  
	   {
		 DelayMs(10);
		 key_up =0;
	 
		 if(DIR_DOWN_KEY ==1)
		 {
			/* 等待按键弹开，退出按键扫描函数 */
			 while(DIR_DOWN_KEY==1); //WT.EDIT 2019-11-15
			   /* 按键扫描完毕，确定按键按下 */
			 return DIR_CW_PRES;
		 }
	
		 else if(START_KEY == 1)
		 {
			 /* 等待按键弹开，退出按键扫描函数 */
			  while(START_KEY==1); //WT.EDIT 2019-11-15
			   /* 按键扫描完毕，确定按键按下 */
			  return START_PRES;
		  }
  
		 else if(DIR_UP_KEY==1)
		 {
			 /* 等待按键弹开，退出按键扫描函数 */
			 while(DIR_UP_KEY==1); // WT.EDIT 2019-11-15
			   /* 按键扫描完毕，确定按键按下 */
	
			 return DIR_CCW_PRES;
		 }
		 else if(DIGITAL_ADD_KEY==1)		
		 {
			  /* 等待按键弹开，退出按键扫描函数 */
			 while(DIGITAL_ADD_KEY==1);
			   /* 按键扫描完毕，确定按键按下 */
			return DIGITAL_ADD_PRES;
		 }
		 
		 else if(DIGITAL_REDUCE_KEY==1)
		 {
			 /* 等待按键弹开，退出按键扫描函数 */
		   while(DIGITAL_REDUCE_KEY==1);
			   /* 按键扫描完毕，确定按键按下 */
		   return DIGITAL_REDUCE_PRES;
		 }
		 
		 else if(DOOR_KEY==1)
		 {
			 /* 等待按键弹开，退出按键扫描函数 */
			 while(DOOR_KEY==1);
			   /* 按键扫描完毕，确定按键按下 */
			 return DOOR_PRES;
		 }
		 
		 else if(HALL_SWITCH_KEY==1)		
		 {
			 /* 等待按键弹开，退出按键扫描函数 */
		   while(HALL_SWITCH_KEY==1);
			   /* 按键扫描完毕，确定按键按下 */
		   return USART_RT_PRES;
		 }
		 
		 else if(MOTOR_STOP_KEY==1) 
		 {
			  /* 等待按键弹开，退出按键扫描函数 */
			 while(MOTOR_STOP_KEY==1);
			   /* 按键扫描完毕，确定按键按下 */
			return MOTOR_STOP_PRES;
		 }
		 else if(WIPERS_KEY==1) 
		 {
			  /* 等待按键弹开，退出按键扫描函数 */
			 while(WIPERS_KEY==1);
			   /* 按键扫描完毕，确定按键按下 */
			return WIPERS_PRES;
		 }
		 #if 0
		 else if(AIR_KEY==1)		 
		 {
			  /* 等待按键弹开，退出按键扫描函数 */
			 while(AIR_KEY==1);
			   /* 按键扫描完毕，确定按键按下 */
			return AIR_PRES;
		 }
         #endif 
	   }
	  else if(DIR_DOWN_KEY == 0 && START_KEY == 0 && DIR_UP_KEY==0 && DIGITAL_ADD_KEY==0 &&\
				  DIGITAL_REDUCE_KEY==0 &&DOOR_KEY==0 && HALL_SWITCH_KEY==0 && \
					 MOTOR_STOP_KEY == 0 && WIPERS_KEY== 0 ) 
      {
        key_up = 1;
      }

        return KEY_UP;
	   
      
	}




#if 0
/***************************************************************
    *
    *Name:Start_key_stateRead(void)
    *
    *
    *
****************************************************************/
KEYState_TypeDef Start_Key_StateRead(void)
{

   if(GPIO_PinRead(START_KEY_GPIO, START_KEY_GPIO_PIN)==1)
   {
      DelayMs(10);
      while(GPIO_PinRead(START_KEY_GPIO, START_KEY_GPIO_PIN)==1);
      return KEY_DOWN ; 

   }
   return KEY_UP;


}
#endif 


