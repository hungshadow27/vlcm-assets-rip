package com.tgame.moudels.yn888shop.controller
{
   import com.tgame.moudels.yn888shop.model.YN888Shop_MsgReceivedProxy;
   import com.tgame.moudels.yn888shop.model.YN888Shop_MsgSendProxy;
   import com.tgame.moudels.yn888shop.view.YN888Shop_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YN888Shop_StartupCommand extends SimpleCommand
   {
      
      public function YN888Shop_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YN888Shop_MsgReceivedProxy());
         facade.registerProxy(new YN888Shop_MsgSendProxy());
         facade.registerMediator(new YN888Shop_Mediator());
      }
   }
}

