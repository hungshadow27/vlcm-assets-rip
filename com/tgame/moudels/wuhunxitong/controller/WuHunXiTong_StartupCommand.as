package com.tgame.moudels.wuhunxitong.controller
{
   import com.tgame.moudels.wuhunxitong.model.WuHunXiTong_MsgReceivedProxy;
   import com.tgame.moudels.wuhunxitong.model.WuHunXiTong_MsgSendProxy;
   import com.tgame.moudels.wuhunxitong.view.WuHunXiTong_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class WuHunXiTong_StartupCommand extends SimpleCommand
   {
      
      public function WuHunXiTong_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new WuHunXiTong_MsgReceivedProxy());
         facade.registerProxy(new WuHunXiTong_MsgSendProxy());
         facade.registerMediator(new WuHunXiTong_Mediator());
      }
   }
}

