/*
 * Copyright (c) 2015, Freescale Semiconductor, Inc.
 * Copyright 2016-2017 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause  MKV46F256VLH16
 */

/*System includes.*/


/* Freescale includes. */
#include "fsl_device_registers.h"
#include "fsl_debug_console.h"
#include "board.h"

#include "fsl_debug_console.h"

#include "fsl_pwm.h"
#include "pin_mux.h"
#include "fsl_xbara.h"
#include "led.h"
#include "key.h"
#include "bldc.h"
#include "adc.h"
#include "pollingusart.h"
#include "output.h"
#include "input.h"
#include "hall.h"
#include "encoder.h"
#include "fsl_xbara.h"
#include "fsl_enc.h"
#include "algorithm.h"


/*******************************************************************************
 * Definitions
 ******************************************************************************/
__IO int32_t HALL_Pulse;  

output_t  motor_ref;
encoder_t en_t;
int32_t PID_Result;
PID_TypeDef  sPID;
__IO int32_t  PID_PWM_Duty;
BLDC_Typedef BLDCMotor;


/*******************************************************************************
 *
 * Code
 *
 * @brief Main function
 *
******************************************************************************/
int main(void)
{
    
     enc_config_t mEncConfigStruct;
     uint8_t printx1[]="Key Dir = 1 is CW !!!! CW \r\n";
     uint8_t printx2[]="Key Dir = 0 is CCW \r\n";
 
     uint8_t ucKeyCode=0;
     uint8_t RxBuffer[8],i,ki,kp,kd,k0;
	 
     int32_t temp;
	 float KP,KI,KD,KPV,KIV,KDV;
     volatile uint16_t Time_CNT,EnBuf[2]={0,0};
	
	 uint32_t eIn_n= 0;
	
     
    XBARA_Init(XBARA);
    BOARD_InitPins();
    BOARD_BootClockRUN();
    BOARD_InitDebugConsole();
    
     LED_Init();
     KEY_Init();
     DelayInit();
     HALL_Init();
     Capture_Input_Init();
     
    OUTPUT_Fucntion_Init();
    ADC_CADC_Init();
   /* Set the PWM Fault inputs to a low value */
    PWM_BLDC_Init();
   // USART_POLLING_Init();
     #if 1  //no interrupt
    /* Initialize the ENC module. */
    ENC_GetDefaultConfig(&mEncConfigStruct);
    ENC_Init(DEMO_ENC_BASEADDR, &mEncConfigStruct);
    ENC_DoSoftwareLoadInitialPositionValue(DEMO_ENC_BASEADDR); /* Update the position counter with initial value. */
    #endif
	Dir=3;
   
	
   while(1)
   {
    ucKeyCode = KEY_Scan(0);
    algpid_t.mHoldPos = ENC_GetHoldPositionValue(DEMO_ENC_BASEADDR);
	//PRINTF("Position differential value: %d\r\n", (int16_t)ENC_GetHoldPositionDifferenceValue(DEMO_ENC_BASEADDR));
   // PRINTF("Position revolution value: %d\r\n", ENC_GetHoldRevolutionValue(DEMO_ENC_BASEADDR));
       
	#ifdef DEBUG_PRINT 
		   PRINTF("CPHod: %d\r\n", mHoldPos);
	#endif
			
		
#if 1
	 /***********Position :Home and End*****************/
        if(algpid_t.total_n ==0)//ÅÐ¶ÏË®Æ½ºÍÖÕÖ¹Î»ÖÃ£¬ÕÒ³öË®Æ½ºÍ´¹Ö±Î»ÖÃÖµ
        {
			
			PWM_Duty =50;
            
            if(eIn_n > 300 ){
                   
				   Detect_HorVer_Position();
                  }
			 if(en_t.HorVer_R_times==2){
		 	      algpid_t.total_n++;
				  HALL_Pulse =0;
		          en_t.VH_Total_Dis = abs(abs(en_t.Horizon_Position) -abs(en_t.Vertical_Position));//¼ÆËãÕû¸öÐÐ³ÌµÄ¾ø¶ÔÖµ
			 }
                
        }
        if(eIn_n > 300)eIn_n =0;
       }
	
#endif 
         
    /***********motor run main*********************/
     if((motor_ref.motor_run == 1)&&(en_t.HorizonStop_flag !=2))//µç»úÔËÐÐ³ÌÐò
      {
   		  if(en_t.eInit_n == 1){
			   PWM_Duty = PID_PWM_Duty;
   		  	}	
   		 
		   #ifdef DRV8302 
            GPIO_PinWrite(DRV8302_EN_GATE_GPIO,DRV8302_EN_GATE_GPIO_PIN,1);
		   #endif 
		  uwStep = HallSensor_GetPinState();
          HALLSensor_Detected_BLDC(PWM_Duty);
          
	     if(en_t.eInit_n !=1)
	     algpid_t.mCurPosValue = ENC_GetPositionValue(DEMO_ENC_BASEADDR); /*read current position of value*/
	        #ifdef DEBUG_PRINT 
	         	PRINTF("CurrPos : %d\r\n", algpid_t.mCurPosValue);
	        #endif
               
		    eIn_n ++; 
		 	if((eIn_n >= 0xfffffffe)&&(en_t.HorVer_R_times==2))eIn_n =1;
			else if(eIn_n >= 0xfffffffe)eIn_n = 0;
           Time_CNT++;
#if 1    
        /* 100ms arithmetic PID */
    	if(Time_CNT % 100== 0){

			algpid_t.mCurPosValue = ENC_GetPositionValue(DEMO_ENC_BASEADDR);  /*read current position of value*/
			if(Dir == 0)//CCW HB0 = Horizion
			{
					
               Horizontal_Decelerate_Function();    
								
			 }//WT.EDIT 2020-03-11
			/*****************Vertical decelerate speed*******************/
		   else{  //Vertical Position judge is boundary

				Vertical_Decelerate_Function();	
				
		}
	   if(Time_CNT ==100){
			Time_CNT = 0;
			HALL_Pulse =0;
	   	}
	   #endif 
	} 
    else if(en_t.HorizonStop_flag==2){
		
           	algpid_t.mCurPosValue = ENC_GetPositionValue(DEMO_ENC_BASEADDR); /*read current position of value*/
			//PRINTF("Position differential value: %d\r\n", (int16_t)ENC_GetHoldPositionDifferenceValue(DEMO_ENC_BASEADDR));
    		//PRINTF("Position revolution value: %d\r\n", ENC_GetHoldRevolutionValue(DEMO_ENC_BASEADDR));
			if(en_t.Idrun_times ==0){
			  Dir =0;
			  /*run to down slowly CCW direction Horzion Dir =0*/
			  PWM_Duty =0;//20;//20
	          uwStep = HallSensor_GetPinState();
	          HALLSensor_Detected_BLDC(PWM_Duty);
			  HALL_Pulse = abs(HALL_Pulse);
			  temp =  algpid_t.mCurPosValue - en_t.Horizon_Position ; //error
			  temp =abs(temp);
			  PRINTF("STOP iError@@ =%d\r\n",temp);
			  if(temp <=80)en_t.Idrun_times++;
			  PRINTF("STOP UP UP UP\r\n");
		  }

		  /*keep balance guide rode*/
	      Dir =1;
          PWM_Duty =30;
          uwStep = HallSensor_GetPinState();
          HALLSensor_Detected_BLDC(PWM_Duty);
		  PRINTF("STOP HOR ^^^^^^^^^^\r\n");
 
          Dir =0;
     
     }
    else{ //µç»úÍ£Ö¹ÔËÐÐ³ÌÐò
        en_t.Idrun_times =0;  
	    en_t.HorizonStop_flag=0;
    
		
		PMW_AllClose_ABC_Channel();
		HALL_Pulse =0;
	
		#ifdef DRV8302
			GPIO_PinWrite(DRV8302_EN_GATE_GPIO,DRV8302_EN_GATE_GPIO_PIN,0);
		#endif 
		
	      DelayMs(50);
	      GPIO_PortToggle(GPIOD,1<<BOARD_LED1_GPIO_PIN);
	      DelayMs(50);
	      HALL_Pulse =0;
          if( motor_ref.motor_run == 3){
		  	
				  UART_ReadBlocking(DEMO_UART, RxBuffer, 8);
                  for(i=0;i<8;i++){
				  	    
						  if(RxBuffer[0]==0xff){
							  kp=RxBuffer[1];
		                      ki=RxBuffer[2];
							  kd=RxBuffer[3];
		                     
		                      PRINTF("KP KI KD = %d %d %d \n\r",kp,ki,kd);
							  PRINTF("KPv KIv KDv = %d %d %d \n\r",RxBuffer[4],RxBuffer[5],RxBuffer[6]);
		                      KP = (float)kp/10;
		                      KI = (float)ki/10;
		                      KD = (float)kd/10;
							  
							  KPV = (float)RxBuffer[4]/10;
		                      KIV = (float)RxBuffer[5]/10;
		                      KDV = (float)RxBuffer[6]/10;
							  motor_ref.motor_run =RxBuffer[7];
					  	  }
						  else{
								 k0=RxBuffer[0];
								 PRINTF("USART Error !!!!!!!!\n\r");
								 PRINTF("k0 = %d \n\r",k0);
								 PRINTF("KP KI KD = %d %d %d \n\r",kp,ki,kd);
								 motor_ref.motor_run =0;
						  }
                     
                  }
		  }
        // PRINTF("Motor Stop !!!!!!!!!!! \r\n");
        // PRINTF("motor_run = %d \r\n",motor_ref.motor_run );
        }
   }
   /**********8Key process********************/  
   if(ucKeyCode !=KEY_UP){

	  switch(ucKeyCode){ 
                 
                  case DIR_CW_PRES ://Dir =1 ,PTE29-CW,KEY1
				  	// Dir = 1;
                      en_t.HorizonStop_flag=0;
			    
				     en_t.Idrun_times =0; 
                   
                    if(Dir == 0) //
	   			    {

                        if((motor_ref.motor_run == 1)&&(motor_ref.Dir_flag == 0))//motor is runing
                        {
                            
                              PWM_Duty= 10;
							  uwStep = HallSensor_GetPinState();
				              HALLSensor_Detected_BLDC( PWM_Duty);
							   PWM_Duty = 5;
							  uwStep = HallSensor_GetPinState();
							  HALLSensor_Detected_BLDC( PWM_Duty);
                              DelayMs(30);
                         
                              motor_ref.Dir_flag =1;
                              Dir =1;
                            
                          
                        }
						else 
						{
							Dir=1;
                       		 motor_ref.Dir_flag =1;
						}
						
                     }
                      else
                      {
                        Dir=1;
                        motor_ref.Dir_flag =1;
                       
                       
                      
                      }
                         UART_WriteBlocking(DEMO_UART, printx1, sizeof(printx1) - 1);
				    HALL_Pulse =0;
                      
				  	break;
        		
                 case START_PRES:
                   
				   en_t.Idrun_times =0; 
                   en_t.HorizonStop_flag=0;
				   motor_ref.motor_run =1;
				   HALL_Pulse =0;
               
                   PRINTF("START_KEY @@@@@@@@@@@@@@@@@@@@@@@@@\n\r");
              
				  break;
		
				 case DIR_CCW_PRES: //Dir = 0;PTE24 = CCW,KEY3
				   // Dir = 0 ; //
				   en_t.HorizonStop_flag=0;
				   en_t.Idrun_times =0; 
				   PRINTF("DIR =0\r\n");
	  			   
			     if(Dir==1) /* Dir = 0; Run to CCW direction */
				   {
	               
	                 if((motor_ref.motor_run == 1) &&(motor_ref.Dir_flag ==1))//motor is runing
	                 {
	                   
	                      PWM_Duty = 10;
						  uwStep = HallSensor_GetPinState();
			              HALLSensor_Detected_BLDC( PWM_Duty);
						   PWM_Duty = 5;
						  uwStep = HallSensor_GetPinState();
						  HALLSensor_Detected_BLDC( PWM_Duty);
	                      DelayMs(30);
	                   
	                      motor_ref.Dir_flag = 0;
	                      Dir =0;
	                    
	                 }
						else
						{
						  Dir =0;
						  motor_ref.Dir_flag = 0;
	                     
						}
						
	               }
	               else
	                  {
	                     
	                     Dir = 0;
	                    
	                     motor_ref.Dir_flag = 0;
	                  
	                  }
				   HALL_Pulse =0;
				 
                 UART_WriteBlocking(DEMO_UART, printx2, sizeof(printx2) - 1);
			   
			
           		break;
				case MOTOR_STOP_PRES:
                    en_t.HorizonStop_flag=0;
					en_t.Idrun_times =0; 
					 motor_ref.motor_run = 3;
					 HALL_Pulse =0;
				 
                     PRINTF("motor stop = %d \n\r",motor_ref.motor_run);
                 break;
				case USART_RT_PRES:
					 
				break;
            default :
              
      
              break;
			
        }
        
	}

  }//end while(1)

/******************************************************************************
 *
 * Function Name:BARKE_KEY_IRQ_HANDLER(void)
 * Function Active: Interrpt brake input key 
 * @brief Interrupt service fuction of switch.
 *
 * This function toggles the LED
 *
******************************************************************************/
void BARKE_KEY_IRQ_HANDLER(void )//void BOARD_BRAKE_IRQ_HANDLER(void)
{
  
    /* Clear external interrupt flag. */
    GPIO_PortClearInterruptFlags(BRAKE_KEY_GPIO, 1U << BRAKE_KEY_GPIO_PIN );
    /* Change state of button. */
   
	
    motor_ref.motor_run = 0;
    en_t.HorizonStop_flag=0;
	PMW_AllClose_ABC_Channel();
	HALL_Pulse =0;
	#ifdef DRV8302
    	GPIO_PinWrite(DRV8302_EN_GATE_GPIO,DRV8302_EN_GATE_GPIO_PIN,0);
    #endif 
	PRINTF("interrupte has happed  \r\n");
	                  
/* Add for ARM errata 838869, affects Cortex-M4, Cortex-M4F Store immediate overlapping
  exception return operation might vector to incorrect interrupt */
#if defined __CORTEX_M && (__CORTEX_M == 4U)
    __DSB();
#endif
}

/*****************************************END**********************************************/


