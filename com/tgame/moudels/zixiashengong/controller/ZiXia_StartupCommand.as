package com.tgame.moudels.zixiashengong.controller
{
   import com.tgame.moudels.zixiashengong.model.ZiXia_MsgReceivedProxy;
   import com.tgame.moudels.zixiashengong.model.ZiXia_MsgSenderProxy;
   import com.tgame.moudels.zixiashengong.view.ZiXia_LingwuPanelMediator;
   import com.tgame.moudels.zixiashengong.view.ZiXia_PlaneMediator;
   import com.tgame.moudels.zixiashengong.view.ZiXia_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class ZiXia_StartupCommand extends SimpleCommand
   {
      
      public function ZiXia_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new ZiXia_MsgReceivedProxy());
         facade.registerProxy(new ZiXia_MsgSenderProxy());
         facade.registerMediator(new ZiXia_PlaneMediator());
         facade.registerMediator(new ZiXia_LingwuPanelMediator());
         facade.registerMediator(new ZiXia_TargetPanelMediator());
      }
   }
}

