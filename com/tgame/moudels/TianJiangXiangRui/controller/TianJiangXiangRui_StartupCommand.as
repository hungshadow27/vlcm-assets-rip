package com.tgame.moudels.TianJiangXiangRui.controller
{
   import com.tgame.moudels.TianJiangXiangRui.model.TianJiangXiangRui_MsgReceivedProxy;
   import com.tgame.moudels.TianJiangXiangRui.model.TianJiangXiangRui_MsgSenderProxy;
   import com.tgame.moudels.TianJiangXiangRui.view.TianJiangXiangRui_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class TianJiangXiangRui_StartupCommand extends SimpleCommand
   {
      
      public function TianJiangXiangRui_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new TianJiangXiangRui_MsgReceivedProxy());
         facade.registerProxy(new TianJiangXiangRui_MsgSenderProxy());
         facade.registerMediator(new TianJiangXiangRui_Mediator());
      }
   }
}

