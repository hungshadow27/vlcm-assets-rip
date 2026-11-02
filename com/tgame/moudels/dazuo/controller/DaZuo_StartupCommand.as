package com.tgame.moudels.dazuo.controller
{
   import com.tgame.moudels.dazuo.model.DaZuo_MsgReceivedProxy;
   import com.tgame.moudels.dazuo.model.DaZuo_MsgSenderProxy;
   import com.tgame.moudels.dazuo.view.DaZuo_DaZuoMediator;
   import com.tgame.moudels.dazuo.view.DaZuo_LiaoShangMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class DaZuo_StartupCommand extends SimpleCommand
   {
      
      public function DaZuo_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new DaZuo_MsgReceivedProxy());
         facade.registerProxy(new DaZuo_MsgSenderProxy());
         facade.registerMediator(new DaZuo_DaZuoMediator());
         facade.registerMediator(new DaZuo_LiaoShangMediator());
      }
   }
}

