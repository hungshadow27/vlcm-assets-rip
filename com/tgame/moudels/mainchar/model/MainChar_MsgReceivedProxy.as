package com.tgame.moudels.mainchar.model
{
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class MainChar_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "MainChar_MsgReceivedProxy";
      
      public function MainChar_MsgReceivedProxy()
      {
         super(NAME,null);
      }
   }
}

